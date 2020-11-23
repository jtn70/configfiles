# CONFIGURATION FILES FOR EDITORS / OS

## FONTS
https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip
https://github.com/adobe-fonts/source-code-pro.git
https://github.com/tonsky/FiraCode.git
https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip

## EDITORS
### VIM
**WINDOWS**

```powershell
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
```


## Colorschemes

### VIM

For vim, use this for example : https://github.com/rafi/awesome-vim-colorschemes.<br/>
My vim file uses this repository from vim themes, if you don't want to install this, edit the vim colorscheme to

```vim
colorscheme default
```

```bash
git clone https://github.com/rafi/awesome-vim-colorschemes
```

**Windows instructions** (in PowerShell and you must open terminal as administrator)

```powershell
Copy-Item '.\awesome-vim-colorschemes\colors\*.vim' -Destination 'C:\Program Files\vim\vim82\colors\'
```

###VISUAL STUDIO CODE

**WINDOWS**

```powershell
copy-item .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json
```

resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState" | copy-item -path .\wtsettings.json -Destination {$_}
New-Item -ItemType file example.txt
https://docs.microsoft.com/en-us/windows/terminal/custom-terminal-gallery/retro-command-prompt
https://int10h.org/oldschool-pc-fonts/download/
https://www.schemecolor.com/python-logo-colors.php
https://docs.microsoft.com/en-us/windows/terminal/custom-terminal-gallery/retro-command-prompt