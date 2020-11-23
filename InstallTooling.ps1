# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json