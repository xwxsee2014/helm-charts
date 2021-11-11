# Helm-Charts

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add <alias> https://xwxsee2014.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.  You can then run `helm search repo <alias>` to see the charts.

To install the <chart-name> chart:

    helm install my-<chart-name> <alias>/<chart-name>

To uninstall the chart:

    helm delete my-<chart-name>

## Repositories

[Elasticsearch](https://github.com/xwxsee2014/helm-charts/blob/gh-pages/docs/elasticsearch.md)

## Version Mapping

| Chart       | Elasticsearch |
| ----------- | -----------   |
| 0.1.y       | 5.6           |
| 1.x.y       | 6.x           |
| 2.x.y       | 7.x           |

### Support Versions

| Chart       | Elasticsearch |
| ----------- | -----------   |
| 0.1.0       | 5.6.16        |
| 1.8.0       | 6.8.20        |
| 2.15.0      | 7.15.2        |

## Notes

From version 1.x.y, the ECK Operator must be installed before deploying this charts. About how to install ECK Operator, please follow the [ECK official instructions](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html#k8s-install-helm).

## Values

| Key         | Type   | Default     | Description |
| ----------- | ------ | ----------- | ----------- |
| environment | string | test        |             |
