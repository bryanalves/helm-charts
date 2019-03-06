# Emby Helm Chart

Emby media server

## Chart Details

This chart will install an instance of Emby media server on the service type of your choice (default ClusterIP) with support for four PVCs
* One PVC to store tv files.
* One PVC to store music files.
* One PVC to store movies files.
* One PVC to store emby configuration

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/emby
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
| gidlist                             | Extra GIDS (for accessing shares)       | 1000                   |
| image.repository                    | Repository name                         | emby/embyserver        |
| image.tag                           | Repository tag                          | 3.6.0.81               |
| image.pullPolicy                    | Repository pull policy                  | IfNotPresent           |
| persistence.config.enabled          | Enable persistent config                | true                   |
| persistence.config.existingClaim    | Name of existing config claim           | emby-config            |
| persistence.tv.enabled              | Enable persistent tv dir                | false                  |
| persistence.tv.existingClaim        | Name of existing tv claim               | nil                    |
| persistence.movies.enabled          | Enable persistent movies dir            | false                  |
| persistence.movies.existingClaim    | Name of existing movies claim           | nil                    |
| persistence.music.enabled           | Enable persistent music dir             | false                  |
| persistence.music.existingClaim     | Name of existing music claim            | nil                    |
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
$ helm install --name my-release -f values.yaml bryanalves/emby
```
> **Tip**: You can use the default [values.yaml](values.yaml)
