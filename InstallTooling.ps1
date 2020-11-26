#Requires -RunAsAdministrator

# Check if this is a pc, currently only works on a pc
if ($IsMacOS -or $IsLinux) {
    Write-Host "This project currently only works on Windows."
    Write-Host "Be patient, ... maybe a Linux or MacOS version is comming your way ;-)"
    exit
}

# Check if minimum version 7 is running
if ($Host.Version.Major -lt 8) {
    Write-Host -ForegroundColor Yellow "You should *REALLY install a new Powershell version"
    while ($true) {
        $instpowershell = Read-Host -Prompt 'Install newest powershell version [yes]/no'
        if ([string]::IsNullOrWhiteSpace($instpowershell)) {
            $instpowershell = 'yes'
        }
        if ($instpowershell.ToLower() -eq 'yes') {
            $links = (Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/latest").Links.Href
            $psdownload = ""
            foreach ($link in $links) {
                if ($link -match '.*PowerShell.*win-x64.msi') {
                    $psdownload = "https://github.com$link"
                    $outfile = [System.IO.Path]::GetFileName($link)
                    $outfile = $env:TEMP + '/' + $outfile
                    Write-Host "Downloading Newest Powershell, please wait..."
                    Invoke-WebRequest -Uri $psdownload -OutFile $outfile
                    Write-Host "After much time, installation is in progress.."
                    $arguments = "/i `"$outfile`" /quiet"
                    Start-Process msiexec.exe -ArgumentList $arguments -Wait
                    Write-Host "A new version ofPowershell is now installed."
                    Write-Host "Switch to this and restart the script."
                    exit
                }
            }
        }
        else {
            Write-Host "... if you do not want to install a new PowerShell,"
            Write-Host "... then I do not want to install anything."
            exit
        }
    }
}

# Powershell Profile
if (Test-Path $profile) {
    while ($true) {
        $instpwshprofile = Read-Host -Prompt 'Powershell User profile exists. Overwrite  [yes]/no '
        if ([string]::IsNullOrWhiteSpace($instpwshprofile)) {
            $instpwshprofile = 'yes'
        }
        if ($instpwshprofile.ToLower() -eq 'yes') {
            Write-Host -ForegroundColor Yellow "Installing Powershell Profile"
            Copy-Item ./Microsoft.PowerShell_profile.ps1 $profile
            break;
        }
        elseif ($instpwshprofile.ToLower() -eq 'no') {
            break;
        }
    }
}
else {
    Write-Host -ForegroundColor Yellow "Installing Powershell Profile"
    Copy-Item ./Microsoft.PowerShell_profile.ps1 $profile
}





# Install visual studio extensions
$vcmodules = @('ms-python.python',
    'ms-dotnettools.csharp',
    'ms-vscode.powershell',
    'ms-vscode.azure-account',
    'ms-vscode.azurecli',
    'vscode-icons-team.vscode-icons',
    'VisualStudioExptTeam.vscodeintellicode'
    'nobuhito.printcode',
    'esbenp.prettier-vscode',
    'ms-mssql.mssql',
    'ms-vscode-remote.remote-ssh-edit',
    'ms-edgedevtools.vscode-edge-devtools'
    'ms-vscode.hexeditor',
    'ms-vscode.vscode-node-azure-pack'
    'ms-vscode-remote.vscode-remote-extensionpack',
    'vsciot-vscode.azure-iot-tools'
    'zhuangtongfa.material-theme')

Write-Host -ForegroundColor Yellow "Installing Visual Studio Code Extensions:"
$instvcmodules = (code --list-extensions)
foreach ($vcmodule in $vcmodules) {
    if ($instvcmodules -match $vcmodule) {
        Write-Host -ForegroundColor White $vcmodule" preinstalled. Skipping..."
    }
    else {
        code --install-extension $vcmodule
    }
}

# Install Visual Studio Code settings
copy-item -path .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json

# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json

# Install vim settings
$tmppath = (resolve-path "c:\Program Files\vim\vim*\colors\")
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath