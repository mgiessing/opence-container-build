#!/bin/bash

#PYTHON_VERSION?=3.8 #CHANNEL?=https://ftp.osuosl.org/pub/open-ce #OPENCE_VERSION?=1.1.1

make build-all PYTHON_VERSION=3.9 OPENCE_VERSION=1.5.1 USE_GPU=false
make build-all PYTHON_VERSION=3.9 OPENCE_VERSION=1.5.1 USE_GPU=true

