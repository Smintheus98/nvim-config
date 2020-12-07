# mydotfiles

These are my Linux configuration dotfiles including zshrc, vimrc(nvim version) and bspwmrc.

## Installation

The Bash script `install.sh` installs everything automatically but still asks for permission before deleting anything.
Please notice that I do not take any guarantee or warranty for the Software or loss of Data!
For more information read the attached license.

If You like You can also install some parts of this configuration manually.
Therefor read the instructions in the according chapters.
  

### `nvim` -  My configuration for neovim:

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

To use this configuration it must be in a place, neovim will find.
The best way to do so, is linking the dirctory to your `$HOME/.config/` directory.
```
ln -sf /path/to/mydotfiles/nvim $HOME/.config/
```
If you want to keep your configs independent from the repository, it is better to copy the directory to the destination place.
```
cp -R /path/to/mydotfiles/nvim $HOME/.config/
```

To use this configuration with Vim you can also link the file `.vimrc` to `init.vim`
```
ln -s /path/to/mydotfiles/nvim/init.vim /$HOME/.vimrc
```
Do not forget to link nvim directory under `$HOME/.config` or edit the file `init.vim` so that the other files can be found.
