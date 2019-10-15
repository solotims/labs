#!/bin/bash

sudo apt install git

sudo apt-get install python openssl libssl-dev git python-msgpack python-qt4

git clone https://github.com/Bitmessage/PyBitmessage $HOME/PyBitmessage

python2 ~/PyBitmessage/src/bitmessagemain.py
