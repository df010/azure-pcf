#!/bin/bash -x
shopt -s expand_aliases
alias webget='wget --header="Authorization: Token KnQV4x3aysCqrmQKP6ja"'
webget https://network.pivotal.io/api/v2/products -O ./products
download () {
  webget https://network.pivotal.io/api/v2/products/$1/releases -O releases
  rel_version=`cat ./releases|jq -r --arg version $2 '.releases[]|select(.version|startswith($version))|"\(.id) \(.version)"'|sort -rn|head -1`
  relid=`echo $rel_version|cut -d" " -f1`
  relversion=`echo $rel_version|cut -d" " -f2`

  webget --post-data="" https://network.pivotal.io/api/v2/products/$1/releases/$relid/eula_acceptance
  webget https://network.pivotal.io/api/v2/products/$1/releases/$relid -O product
  webget -c -O $1.$relversion.pivotal `cat ./product|jq -r '.product_files[]| select(.aws_object_key| endswith(".pivotal"))._links.download.href'`
}

#download elastic-runtime 1.10
#download p-redis 1.8
#download p-rabbitmq 1.8
#download p-mysql 1.8
download pcf-metrics 1.3
#pivotal-gpdb
#p-gemfire
#stemcells-windows-server-internal
#pivotal-hdb
#p-redis
#p-jfrog-artifactory
#pcfdev
#cloud-cache
#buildpacks
#p-new-relic
#p-riakcs
#pivotal-app-suite
#big-data
#pcf-services
#pcf-service-broker-for-aws
#pivotal-cloud-foundry-log-search
#p-data-sync
#pivotal-tracker-cf
#p-knowtify
#solace-messaging
#push-notification-service
#p-app-distribution
#p-concourse
#p-identity
#p-spring-flo
#aerospike-ee-on-demand
#pivotal-hd
#p-spring-cloud-services
#p-gitlab
#redis-labs-enterprise-cluster-for-pcf-service-broker
#crunchy-postgresql
#pcf-services-sdk
#dingo-postgresql-for-pcf
#apigee-edge-for-pcf-service-broker
#p-ipsec-addon
#api-gateway
#p-datometry-hyper-q-for-piotal-data-suite
#p-alpine-chorus-for-pivotal-big-data-suite
#stemcells
#pivotal-rabbitmq-service
#gemfirexd
#cloudsoft
#p-appdynamics
#p-appdog
#p-clamav-addon
#a9s-consul
#gcp-service-broker
#aerospike-ee-managed-service
#p-dynatrace
#aerospike
#rootfs
#first-data-payments
#service-backups-sdk
#p-syslog-addon
#p-fim-addon
#service-metrics-sdk
#on-demand-services-sdk
#azuqua
#wombatoam
#forgerock
#blue-medora-nozzle
#mongodb-enterprise-service
#apigee-edge-installer
#pcf-automation
#a9s-bosh
#a9s-elasticsearch
#p-ssc-gemfire
#elastic-runtime
#stemcells-windows-server
#runtime-for-windows
#pcf-metrics
#microsoft-azure-service-broker
#gcp-stackdriver-nozzle
#pivotal-hdp
#pivotal-rabbitmq
#pivotal-tcserver
#p-cassandra
#edb-postgres
#pivotal-cf
#tibco-businessworks
#a9s-mongodb
#p-mysql
#a9s-postgresql
#signal-sciences-service-broker
#goblob
#ops-metrics
#mulesoft-anypoint
#pivotal-web-server
#ops-manager
#bosh-release-for-windows
#isolation-segment
#hazelcast
#pivotal-gemfire
#dyadic-ekm-service-broker
#datastax-cassandra-service-broker
