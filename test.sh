#!/bin/bash

freebsd-update fetch
freebsd-update install

pkg update

pkg install sudo

pkg install vim