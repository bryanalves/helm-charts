# Mosquitto Helm Chart

Chart for installing Eclipse Mosquitto

## Chart Details

This chart will install an instance of mosquitto ready for IOT.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/mosquitto
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter                            | Description                        | Default             |
| ------------------------------------ | -----------------------------------| --------------------|
| replicaCount                         | Number of instances                | 1                   |
| image.repository                     | Repository name                    | eclipse-mosquitto   |
| image.tag                            | Repository tag                     | 1.6.4               |
| image.pullPolicy                     | Repository pull policy             | IfNotPresent        |
| persistence.enabled                  | Enable persistent metadata         | false               |
| persistence.existingClaim            | Name of existing metadata claim    | nil                 |
| service.type                         | Type of service                    | ClusterIP           |
| service.port                         | Port for the service               | 1883                |
| resources                            | Pod resources                      | {}                  |
| nodeSelector                         | Pod node selector                  | {}                  |
| tolerations                          | Pod tolerations                    | []                  |
| affinity                             | Pod affinity                       | {}                  |
| config                               | App configuration                  | see values.yaml     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/mosquitto
```
> **Tip**: You can use the default [values.yaml](values.yaml)
