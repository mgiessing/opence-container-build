# OpenCE Container Images

This repository provides container images for [Open-CE](https://github.com/open-ce) environments.

Images are preconfigured with the corresponding build version from [FTP Orgeon State University](https://ftp.osuosl.org/pub/open-ce/).

It is divided into 3 major frameworks: <br>
PyTorch, Tensorflow & Onnx<br>
<br>
Each framwork comes in 4 flavors:<br>
- GPU-python3
- CPU-python3
- GPU-jupyter
- CPU-jupyter

## Compatibilty Matrix for major Frameworks

Open-CE | Python | CUDA | Tensorflow | Pytorch | ONNX | ONNX Runtime | XGBoost | LightGBM
--- | --- | --- | --- | --- | --- |--- | --- |--- 
v1.5.1 | 3.9 | 11.2 | 2.7.0 | 1.10.1 | 1.10.2 | 1.10.0 | 1.5.1 | 3.3.1
v1.4.1 | 3.8 | 11.2 | 2.6.2 | 1.9.0 | 1.7.0 | 1.7.2 | 1.4.2 | 3.2.1
v1.3.1 | 3.8 | 11.2 | 2.5.1 | 1.8.1 | 1.7.0 | 1.7.2 | 1.4.2 | 3.2.1
v1.2.2 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A| N/A
v1.2.0 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A | N/A
v1.1.2 | 3.8 | 10.2/11.0 | 2.4.1 | 1.7.1 | 1.6.0 | N/A | N/A | N/A
v1.1.1 | 3.8 | 10.2 | 2.4.0 | 1.7.1 | 1.6.0 | N/A | N/A | N/A
