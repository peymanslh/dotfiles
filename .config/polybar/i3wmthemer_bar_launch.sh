#!/bin/env sh

pkill polybar

sleep 1;

polybar base && polybar mon2 &
