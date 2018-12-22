# Fluentd Helm Chart

A helm chart for fluentd

## Chart Details

This chart is meant to be a general purpose chart for fluentd aggregation, using another fluentd or fluentbit to source data from.  It's coded to work with the fluentd images on dockerhub (https://hub.docker.com/r/fluent/fluentd/). Notably this means /fluentd/etc for configuration.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/fluentd
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter                           | Description                             | Default                                                          |
| ----------------------------------- | --------------------------------------- | ---------------------------------------------------------------- |
| replicaCount                        | Number of instances                     | 1                                                                |
| image.repository                    | Repository name                         | bryanalves/fluentd                                               |
| image.tag                           | Repository tag                          | 0.5                                                              |
| image.pullPolicy                    | Repository pull policy                  | IfNotPresent                                                     |
| service.type                        | Type of service                         | ClusterIP                                                        |
| service.ports                       | Port for the service                    | `[{name: "monitor-agent", protocol: TCP, containerPort: 24220}]` |
| configMaps                          | List of config files                    | {}                                                               |
| env                                 | List of pod environment variables files | {}                                                               |
| resources                           | Pod resources                           | {}                                                               |
| nodeSelector                        | Pod node selector                       | {}                                                               |
| tolerations                         | Pod tolerations                         | []                                                               |
| affinity                            | Pod affinity                            | {}                                                               |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/fluentd
```
> **Tip**: You can use the default [values.yaml](values.yaml)

