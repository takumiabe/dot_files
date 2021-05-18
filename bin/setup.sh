#! /bin/bash

cd "$(dirname $0)/.."

ln -s $PWD/.bashrc.d ~/.bashrc.d
if [ -f ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -s $PWD/.bashrc ~/.bashrc

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -s $PWD/.gitconfig ~/.gitconfig
