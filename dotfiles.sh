#!/bin/bash


for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    
    if [ -f $HOME/$f  ] && [ ! -L $HOME/$f ]; then
        mv $HOME/$f "${HOME}/${f}_bck"
    fi


    ln -s $HOME/dotfiles/$f $HOME/$f
done

mkdir $HOME/.vimbackup
git submodule add https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim

