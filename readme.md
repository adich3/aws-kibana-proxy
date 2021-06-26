# aws-kibana-proxy
This Envoy Kibana proxy is helpful for accessing Kibana which is hosted on AWS Managed Elasticsearch. 

The purpose of this proxy is to expose the Kibana which is hosted by AWS in managed Elasticsearch service. It also exposes the kibana alone instead of the entire ELS Domain and which can be used to create internal K8s Ingress endpoints. 

Envoy Proxy with a HTTPs listener is configured as a reverse proxy to AWS ELS domain. 
## Configuration
The application expects a ENV `AWS_ELS_HOST` to be configured which should be pointed to the AWS ELS Domain. 
## References
AWS Kibana:
https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-kibana.html
Envoy:
https://www.envoyproxy.io/docs/envoy/latest/intro/what_is_envoy
