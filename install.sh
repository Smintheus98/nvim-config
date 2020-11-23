#!/bin/bash

REPO_LOCATION=${0%/*}

if [[ -d $HOME/.config/nvim ]] ; then
    echo -e "Directory $HOME/.config/nvim already exists. Do You want to replace it?\nAll your Data in this directory will be deleted!"
    read -p "Are you sure to replace this directory? [y/N] " REPLACE_NVIM
fi

if [[ "$REPLACE_NVIM" == [yY]* ]] ; then
    rm -rf $HOME/.config/nvim
    ln -s $REPO_LOCATION/nvim $HOME/.config/nvim
fi
