# IPMI exporter Helm Chart

Prometheus exporter for IPMI data

## Chart Details

This chart will read the ipmi device node on the host and expose the information as a prometheus exporter. Because this uses host device resources, it runs as hostNetwork and privileged

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add bryanalves https://bryanalves.github.io/helm-charts
$ helm install --name my-release bryanalves/ipmi-exporter
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of this chart and their default values

| Parameter        | Description                 | Default                                                    |
| ---------------- | --------------------------- | ---------------------------------------------------------- |
| image.repository | Repository name             | lovoo/ipmi_exporter                                        |
| image.tag        | Repository tag              | latest                                                     |
| image.pullPolicy | Repository pull policy      | IfNotPresent                                               |
| deviceName       | Host device IPMI name       | /dev/ipmi0                                                 |
| annotations      | Port for the daemonset pods | {prometheus.io/scrape: 'true', prometheus.io/port: '9289'} |
| resources        | Pod resources               | {}                                                         |
| nodeSelector     | Pod node selector           | {ipmi: 'true'}                                             |
| tolerations      | Pod tolerations             | []                                                         |
| affinity         | Pod affinity                | {}                                                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/ipmi-exporter
```
> **Tip**: You can use the default [values.yaml](values.yaml)

