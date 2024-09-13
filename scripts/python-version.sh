#!/bin/bash
set -ex &&
  sed -i '/python 3.11.*/d' /opt/conda/conda-meta/pinned &&
  conda install python=3.10 -y &&
  python3 -m pip install --upgrade pip wheel
