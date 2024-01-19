# OpenCE Container Images

This repository provides container images for [Open-CE](https://github.com/open-ce) environments.

Images are available from [quay.io](https://quay.io/mgiessing/opence)

**Starting with Open-CE v1.8.0 the images are going to be preconfgured with builds from [RocketCE](https://anaconda.org/rocketce)!**

It is divided into 3 major frameworks: <br>
PyTorch, Tensorflow & Onnx<br>
<br>
Each framwork comes in 4 flavors:<br>
- GPU-python3
- CPU-python3
- GPU-jupyter
- CPU-jupyter

## Using the Images 

Prerequisites are:
- [docker-ce](https://docs.docker.com/engine/install/) 
- [nvidia-docker2](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker) 


### Pure python images

One can start a GPU-enabled container by:

`docker run -ti --rm --gpus 1 quay.io/mgiessing/opence:1.9.1`

GPU availability is given if GPU devices are shown as below:

```python
>>> import tensorflow as tf
>>> tf.config.list_physical_devices('GPU')
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```

### Jupyter images

For jupyter images one must use the `-p/--port` and optionally `-v/--volume` flag to forward internal port to the host and optionally mount a volume for persisting data. Also pass the `--user root` to avoid permission errors.

```bash
docker run \
    -ti \
    -u root \
    -p 8888:8888 \
    -v ${HOME}/notebooks:${HOME}/notebooks \
    --rm \
    --gpus 1 \
    quay.io/mgiessing/opence:1.9.1-jupyter
```

Jupyter can then be accessed in browser.

---

## Compatibilty Matrix for major Frameworks

**Starting with OpenCE 1.8.1 all builds will have optimized Python 3.10!**

**Starting with OpenCE 1.6.1 all CPU builds will be Power10/MMA enabled!**

Open-CE | Python | CUDA | Tensorflow | Pytorch | ONNX | ONNX Runtime | XGBoost | LightGBM
--- | --- | --- | --- | --- | --- |--- | --- |--- 
v1.8.1 | 3.10 | 11.4 | 2.10.1 | 1.13.1 | 1.12.0 | 1.13.1 | 1.7.3 | 3.3.4
v1.8.0 | 3.10 | 11.4 | 2.10.1 | 1.13.0 | 1.12.0 | 1.13.1 | 1.7.1 | 3.3.3
v1.7.2 | 3.10 | 11.4 | 2.9.2 | 1.12.1 | 1.12.0 | 1.12.1 | 1.6.2 | 3.3.2
v1.6.1 | 3.9 | 11.2 | 2.8.1 | 1.10.2 | 1.11.0 | 1.11.0 | 1.5.2 | 3.3.2
v1.5.1 | 3.9 | 11.2 | 2.7.0 | 1.10.1 | 1.10.2 | 1.10.0 | 1.5.1 | 3.3.1
v1.4.1 | 3.8 | 11.2 | 2.6.2 | 1.9.0 | 1.7.0 | 1.7.2 | 1.4.2 | 3.2.1
v1.3.1 | 3.8 | 11.2 | 2.5.1 | 1.8.1 | 1.7.0 | 1.7.2 | 1.4.2 | 3.2.1
v1.2.2 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A| N/A
v1.2.0 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A | N/A
v1.1.2 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A | N/A
v1.1.1 | 3.8 | 10.2 | 2.4.0 | 1.7.1 | 1.6.0 | N/A | N/A | N/A

<br>

Due to dependency mismatches the full build might not always have the newest version! E.g. tensorflow is not released in 1.8.1, the full build will install it and it has a dependency against numpy=1.23.4 and therefore Pytorch, LightGBM and XGBoost will be in 1.8.0 versions.

The base image can be used to install the newest version of a specific framework.

## Build

In order to build the images docker and the docker buildx buildkit are required.
One can have a look at the `build.sh` file and the Makefile for options and build flags.

Generally `make build-all USE_GPU=true` build all Images with GPU support and `make build-all USE_GPU=false` all CPU/P10 images.
