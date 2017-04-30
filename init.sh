#!/bin/bash


for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    
    if [ -f $HOME/$f  ] && [ ! -L $HOME/$f ]; then
        mv $HOME/$f "${HOME}/${f}_bck"
    fi


    if [ ! -L $HOME/$f ]; then
        ln -s $HOME/dotfiles/$f $HOME/$f
    fi
done


if [ ! -e bundle ]; then
    mkdir $HOME/.vimbackup
    mkdir bundle
    git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
fi
