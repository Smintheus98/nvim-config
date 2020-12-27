# nvim-config

This is my configuration for neovim.

## Installation

The Bash script `install.sh` installs the configuration automatically but still asks for permission before deleting anything.
Please notice that I do not take any guarantee or warranty for the Software or loss of Data!
For more information read the attached license.

For manual installation read the instructions below.
  

### Files:

```
nvim
├── editing.vim
├── init.vim
├── plugins.vim
└── settings.vim
```

The main file is `init.vim`.
It sources the other files.
* `plugins.vim` includes my favored plugins others created and published and sets some konfigurations for them.
* `settings.vim` contains some sets and unsets of specific Vim-options to my taste.
* `editing.vim` contains definitions of commands, automatic commands, mappings (and abbreviations).

To use this configuration it must be placed where neovim will find.
The best way to do so is linking the dirctory under the `~/.config/` directory.
!!! Be aware that this will overwrite the previous configuration !!!
```
rm -rI ~/.config/nvim
ln -s /path/to/mydotfiles/nvim ~/.config/
```
To keep the configutation independent from the repository copying the directory is to be preferred.
```
rm -rI ~/.config/nvim
cp -r /path/to/mydotfiles/nvim ~/.config/
```
For use of this configuration wit vanilla Vim the file `init.vim` needs to be linked to `~/.vimrc`.
Remember to adapt the files accordingly.
```
rm -i ~/.vimrc
ln -s /path/to/mydotfiles/nvim/init.vim ~/.vimrc
```
