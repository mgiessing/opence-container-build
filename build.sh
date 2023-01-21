#!/bin/bash

#PYTHON_VERSION?=3.8 #CHANNEL?=https://ftp.osuosl.org/pub/open-ce #OPENCE_VERSION?=1.1.1

make build-all PYTHON_VERSION=3.9 CHANNEL=https://ftp.osuosl.org/pub/open-ce/1.7.2-p10/ OPENCE_VERSION=1.7.2 USE_GPU=false
make build-all PYTHON_VERSION=3.9 OPENCE_VERSION=1.7.2 USE_GPU=true

