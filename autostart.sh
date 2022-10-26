#!/bin/bash

dbus-launch bash &
startx &
./KomorebiBSD/build/komorebi &
polybar mybar &

