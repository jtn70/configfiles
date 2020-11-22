# CONFIGURATION FILES FOR EDITORS / OS

## Colorthemes
For vim, use this for example : https://github.com/rafi/awesome-vim-colorschemes.
My vim file uses this repository from vim themes, if you don't want to install this,
edit the vim colorscheme to
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