#!/bin/sh
run_once() {
  pkill -f "$1"
  $@ &
}

run_once waybar
run_once swaybg -i ~/.config/mango/wallpapers/wp0.jpg
