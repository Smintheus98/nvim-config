#!/bin/bash

REPO_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ -e $HOME/.config/nvim ]] ; then
    echo -e "Directory or file $HOME/.config/nvim already exists. Do You want to replace it?\nAll your Data in this directory will be deleted!"
    read -p "Are you sure to replace this directory? [y/N] " REPLACE_NVIM
    if [[ "$REPLACE_NVIM" == [yY]* ]] ; then
        rm -rf $HOME/.config/nvim
        ln -s $REPO_LOCATION/nvim $HOME/.config/nvim
    fi
else
    ln -sf $REPO_LOCATION/nvim $HOME/.config/nvim
fi

read -p "Install vim-plug? [Y/n] " INST_VIMPLUG
if ! [[ "$INST_VIMPLUG" == [nN]* ]] ; then 
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    python3 -m pip install --user pynvim
    read -p "Install plugins? [Y/n] " INST_PLUGINS
    if ! [[ "$INST_PLUGINS" == [nN]* ]] ; then 
        nvim +PlugInstall +qa --headless
    fi
fi

