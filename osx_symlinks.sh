#!/usr/bin/env bash

if [ ! -L $HOME/.mackup.cfg ]; then
  rm $HOME/.mackup.cfg 2> /dev/null
  ln -s $HOME/Developer/scaffold/osx/mackup.cfg $HOME/.mackup.cfg
fi
