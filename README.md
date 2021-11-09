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
