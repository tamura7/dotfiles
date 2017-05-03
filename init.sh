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


if [ ! -e .vim/bundle ]; then
    mkdir .vim/bundle
    git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
fi
if [ ! -e .undo ]; then
    mkdir .undo
fi
if [ ! -e $HOME/.vimbackup ]; then
    mkdir $HOME/.vimbackup
fi
