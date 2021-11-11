# Elasticsearch

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
