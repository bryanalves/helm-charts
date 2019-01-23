# Smart-exporter Helm Chart

Prometheus "exporter" for HDD S.M.A.R.T. data that uses traditional http collection

## Chart Details

This chart will install an instance of smart-exporter on the service type of your choice (default ClusterIP) that will export smartmon.sh metrics over http

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/smart-exporter
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter                 | Description                 | Default                        |
| ------------------------- | --------------------------- | ------------------------------ |
| replicaCount              | Number of instances         | 1                              |
| image.repository          | Repository name             | bryanalves/smart\_exporter     |
| image.tag                 | Repository tag              | 0.2                            |
| image.pullPolicy          | Repository pull policy      | IfNotPresent                   |
| service.type              | Type of service             | ClusterIP                      |
| service.port              | Port for the service        | 80                             |
| service.annotations       | Annotations for the service | {prometheus.io/scrape: "true"} |
| resources                 | Pod resources               | {}                             |
| nodeSelector              | Pod node selector           | {}                             |
| tolerations               | Pod tolerations             | []                             |
| affinity                  | Pod affinity                | {}                             |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/smart-exporter
```
> **Tip**: You can use the default [values.yaml](values.yaml)

