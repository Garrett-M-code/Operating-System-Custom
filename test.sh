#!/bin/bash

pkg update

pkg install sudo

cd /usr/ports/editors/vim/
make install clean
