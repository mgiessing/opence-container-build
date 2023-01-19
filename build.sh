#!/bin/bash

#PYTHON_VERSION?=3.8 #CHANNEL?=https://ftp.osuosl.org/pub/open-ce #OPENCE_VERSION?=1.1.1

make build-all PYTHON_VERSION=3.8 OPENCE_VERSION=1.2.0 USE_GPU=true
make build-all PYTHON_VERSION=3.8 OPENCE_VERSION=1.2.0 USE_GPU=false

make build-all PYTHON_VERSION=3.8 OPENCE_VERSION=1.2.2 USE_GPU=true
make build-all PYTHON_VERSION=3.8 OPENCE_VERSION=1.2.2 USE_GPU=false



