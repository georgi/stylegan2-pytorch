#!/bin/bash

PKL_URL=$1
PKL_FILE=$(basename $PKL_URL)
PT_FILE="${PKL_FILE%.*}.pt"

git submodule init
git submodule update

mkdir -p /storage/models

pip install ninja

wget --quiet $PKL_URL

python convert_weight.py --gen --disc --repo ./stylegan2 $PKL_FILE && \
  mv $PT_FILE /storage/models 

