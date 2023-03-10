DOCKER_CMD?=docker buildx build #docker buildx

REPO=quay.io/mgiessing
IMAGE=opence

ROOT_IMAGE?=mambaorg/micromamba
PYTHON_VERSION?=3.10
CHANNEL?=rocketce
OPENCE_VERSION?=1.8.1
PLATFORMS?=linux/ppc64le #,linux/amd64

USE_GPU?=false

ifeq ($(USE_GPU), false)
  GPU_CPU+=-cpu
else
  GPU_CPU+=""
endif

build-all: build-full-jupyter build-tf-jupyter build-pt-jupyter build-onnx-jupyter

build-base:
	${DOCKER_CMD} --push \
	--platform ${PLATFORMS} \
	--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
	--build-arg ROOT_IMAGE=${ROOT_IMAGE} \
	--build-arg CHANNEL=${CHANNEL} \
	--build-arg OPENCE_VERSION=${OPENCE_VERSION} \
	-t ${REPO}/${IMAGE}:${OPENCE_VERSION}-base \
	-f dockerfiles/Dockerfile.base .

build-full: build-base
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
	--build-arg BASE_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-base \
	--build-arg GPU_CPU=${GPU_CPU} \
	-t ${REPO}/${IMAGE}:${OPENCE_VERSION}${GPU_CPU} \
	-f dockerfiles/Dockerfile.full .

build-tf: build-base
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
	--build-arg BASE_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-base \
	--build-arg GPU_CPU=${GPU_CPU} \
	-t ${REPO}/${IMAGE}:${OPENCE_VERSION}-tensorflow${GPU_CPU} \
	-f dockerfiles/Dockerfile.tensorflow .

build-pt: build-base
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
        --build-arg BASE_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-base \
        --build-arg GPU_CPU=${GPU_CPU} \
        -t ${REPO}/${IMAGE}:${OPENCE_VERSION}-pytorch${GPU_CPU} \
        -f dockerfiles/Dockerfile.pytorch .

build-onnx: build-base
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
        --build-arg BASE_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-base \
	--build-arg GPU_CPU=${GPU_CPU} \
        -t ${REPO}/${IMAGE}:${OPENCE_VERSION}-onnx${GPU_CPU} \
        -f dockerfiles/Dockerfile.onnx .

build-full-jupyter: build-full
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
	--build-arg FULL_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}${GPU_CPU} \
	-t ${REPO}/${IMAGE}:${OPENCE_VERSION}${GPU_CPU}-jupyter \
	-f dockerfiles/Dockerfile.full.jupyter .

build-tf-jupyter: build-tf
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
        --build-arg TF_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-tensorflow${GPU_CPU} \
        -t ${REPO}/${IMAGE}:${OPENCE_VERSION}-tensorflow${GPU_CPU}-jupyter \
        -f dockerfiles/Dockerfile.tensorflow.jupyter .

build-pt-jupyter: build-pt
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
        --build-arg PT_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-pytorch${GPU_CPU} \
        -t ${REPO}/${IMAGE}:${OPENCE_VERSION}-pytorch${GPU_CPU}-jupyter \
        -f dockerfiles/Dockerfile.pytorch.jupyter .


build-onnx-jupyter: build-onnx
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
        --build-arg ONNX_IMG=${REPO}/${IMAGE}:${OPENCE_VERSION}-onnx${GPU_CPU} \
        -t ${REPO}/${IMAGE}:${OPENCE_VERSION}-onnx${GPU_CPU}-jupyter \
        -f dockerfiles/Dockerfile.onnx.jupyter .

