# Install

# Install visual studio extensions
code --install-extension ms-python.python
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension vscode-icons-team.vscode-icons
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension nobuhito.printcode
code --install-extension esbenp.prettier-vscode
code --install-extension ms-mssql.mssql
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-edgedevtools.vscode-edge-devtools
code --install-extension ms-vscode.hexeditor
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension vsciot-vscode.azure-iot-tools

# Install Visual Studio Code settings
copy-item -path .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json

# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json

# Install vim settings
$tmppath = (resolve-path "c:\Program Files\vim\vim*\colors\")
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath