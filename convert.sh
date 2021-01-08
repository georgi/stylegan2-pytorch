#!/bin/bash

PKL_URL=$1
PKL_FILE=$(basename $PKL_URL)
PT_FILE="${PKL_FILE%.*}.pt"

!wget --quiet $PKL_URL

python convert_weight.py --gen --disc --repo ./stylegan2 $PKL_FILE

mkdir -p /storage/models

mv $PT_FILE /storage/models 

