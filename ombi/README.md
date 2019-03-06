# Ombi Helm Chart

Ombi media requester

## Chart Details

This chart will install an instance of ombi on the service type of your choice (default ClusterIP) with support for a configuration PVC.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/ombi
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
| uid                                 | User ID (for accessing shares)          | 1000                   |
| gid                                 | Group ID (for accessing shares)         | 1000                   |
| timezone                            | Timezone                                | America/New\_York      |
| image.repository                    | Repository name                         | linuxserver/ombi       |
| image.tag                           | Repository tag                          | 137                    |
| image.pullPolicy                    | Repository pull policy                  | IfNotPresent           |
| persistence.config.enabled          | Enable persistent config                | true                   |
| persistence.config.existingClaim    | Name of existing config claim           | ombi-config            |
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
$ helm install --name my-release -f values.yaml bryanalves/ombi
```
> **Tip**: You can use the default [values.yaml](values.yaml)
