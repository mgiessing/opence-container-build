# Deployment of Jupyter Lab in OpenShift

## For the cpu-notebook:

If the pod should be scheduled on a specific node (e.g. that is Power10 and has MMA) add a nodeSelector to the Pod specs:

```yaml
[...]
spec:
  nodeSelector:
    kubernetes.io/hostname: <worker>
  containers:
[...]
```

Apply the yaml file with:

`oc apply -f cpu-notebook.yaml`

## For the gpu-notebook:

The GPU notebook requires the [NVIDIA GPU-operator](https://github.com/mgiessing/gpu-operator/blob/master/INSTALL_POWER.md) to be installed.

If the pod should be scheduled on a worker with a specific GPU, the nodeSelector can be used to specify the exact worker (see above) or any worker with the desired GPU model.

a.) Find out the GPU label:

```bash
$ oc get nodes -o yaml | grep -i "gpu.product:"
      nvidia.com/gpu.product: Tesla-V100-SXM2-32GB
      nvidia.com/gpu.product: Tesla-T4
```

b.) Edit the yaml and insert the GPU that should be used:

```bash
[...]
spec:
  nodeSelector:
    nvidia.com/gpu.product: Tesla-T4
  containers:
[...]
```

Apply the yaml file with:

`oc apply -f gpu-notebook.yaml`
