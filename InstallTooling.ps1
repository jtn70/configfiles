# Install

# Install Visual Studio Code settings
copy-item -path .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json

# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json

# Install vim settings
$tmppath = (resolve-path "c:\Program Files\vim\vim*\colors\")
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath