# RTorrent Helm Chart

Opinionated rtorrent configuration with tagging for tv, movie, and music downloads

## Chart Details

This chart will install an instance of rtorrent ready to put tv, music, and movies in separate download locations

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/rtorrent
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter                            | Description                                             | Default                                                    |
| ------------------------------------ | ------------------------------------------------------- | ---------------------------------------------------------- |
| replicaCount                         | Number of instances                                     | 1                                                          |
| image.repository                     | Repository name                                         | bryanalves/rtorrrent                                       |
| image.tag                            | Repository tag                                          | 0.0.2                                                      |
| image.pullPolicy                     | Repository pull policy                                  | IfNotPresent                                               |
| persistence.enabled                  | Enable persistent metadata                              | false                                                      |
| persistence.existingClaim            | Name of existing metadata claim                         | nil                                                        |
| service.type                         | Type of service                                         | ClusterIP                                                  |
| service.port                         | Port for the service (scgi)                             | 5000                                                       |
| service.httpPort                     | Port for the service (web-scgi)                         | 80                                                         |
| metricService.type                   | Type of service for exporter                            | ClusterIP                                                  |
| metricService.port                   | Service port for the exporter                           | 9135                                                       |
| metricService.annotations            | Annotations for exporter service                        | {prometheus.io/scrape: "true", prometheus.io/port: "9135"} |
| ingressService.type                  | Service type to handle incoming connections to rtorrent | NodePort                                                   |
| ingressService.rtorrentPort          | Pod port for incoming connections                       | 57778                                                      |
| ingressService.dhtPort               | Pod port for DHT connections                            | 57779                                                      |
| ingressService.externalTrafficPolicy | Traffic policy for external connections                 | Local                                                      |
| extraVolumes                         | Extral volumes (for diffent download locations)         | []                                                         |
| extraVolumeMounts                    | Mount locations for extra volumes                       | []                                                         |
| resources                            | Pod resources                                           | {}                                                         |
| nodeSelector                         | Pod node selector                                       | {}                                                         |
| tolerations                          | Pod tolerations                                         | []                                                         |
| affinity                             | Pod affinity                                            | {}                                                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/rtorrent
```
> **Tip**: You can use the default [values.yaml](values.yaml)

