# Smart-exporter Helm Chart

Prometheus "exporter" for HDD S.M.A.R.T. data that uses node\_exporter textcollector

## Chart Details

This chart will install an instance of Couchpotato on the service type of your choice (default ClusterIP) with support for a trio of PVCs

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

| Parameter                 | Description               | Default                    |
| ------------------------- | ------------------------- | -------------------------- |
| replicaCount              | Number of instances       | 1                          |
| image.repository          | Repository name           | bryanalves/smart\_exporter |
| image.tag                 | Repository tag            | latest                     |
| image.pullPolicy          | Repository pull policy    | IfNotPresent               |
| persistence.enabled       | Enable persistent storage | true                       |
| persistence.accessMode    | Storage PVC AccessMode    | ReadWriteMany              |
| persistence.size          | Storage PVC request size  | 1Gi                        |
| persistence.storageClass  | Storage PVC request size  | standard                   |
| persistence.existingClaim | Existing storage PVC name | nil                        |
| resources                 | Pod resources             | {}                         |
| nodeSelector              | Pod node selector         | {}                         |
| tolerations               | Pod tolerations           | []                         |
| affinity                  | Pod affinity              | {}                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml bryanalves/smart-exporter
```
> **Tip**: You can use the default [values.yaml](values.yaml)

