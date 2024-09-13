#!/bin/bash
set -ex &&
  apt-get update &&
  apt-get install -y tzdata &&
  ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&
  dpkg-reconfigure -f noninteractive tzdata
