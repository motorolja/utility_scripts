#!/bin/sh                                                                                                                                                                                       
# Automatically setup external monitor on T450s when using a docking station

xrandr_command="/usr/bin/xrandr"
sed_command="/bin/sed"

is_docked=`$xrandr_command | $sed_command -n '/DP2-2 connected/p'`

if [ -n "$is_docked" ]; then
  $xrandr_command --output DP2-2 --auto --left-of eDP1
else
  $xrandr_command --output eDP1 --primary --output DP2-2 --off
fi
