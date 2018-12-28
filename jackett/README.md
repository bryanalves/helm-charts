# Jackett Helm Chart

Jackett search index manager

## Chart Details

This chart will install an instance of Jackett on the service type of your choice (default ClusterIP) with a PVC for configuration

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/jackett
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter                           | Description                             | Default                |
| ----------------------------------- | --------------------------------------- | ---------------------- |
| replicaCount                        | Number of instances                     | 1                      |
| image.repository                    | Repository name                         | linuxserver/jackett    |
| image.tag                           | Repository tag                          | latest                 |
| image.pullPolicy                    | Repository pull policy                  | IfNotPresent           |
| persistence.enabled                 | Enable persistent config                | true                   |
| persistence.existingClaim           | Name of existing config claim           | nil                    |
| service.type                        | Type of service                         | ClusterIP              |
| service.port                        | Port for the service                    | 80                     |
| ingress.enabled                     | Whether to create ingress or not        | false                  |
| ingress.\*                          | Helm standard ingress (see values.yaml) | {}                     |
| resources                           | Pod resources                           | {}                     |
| nodeSelector                        | Pod node selector                       | {}                     |
| tolerations                         | Pod tolerations                         | []                     |
| affinity                            | Pod affinity                            | {}                     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/jackett
```
> **Tip**: You can use the default [values.yaml](values.yaml)

