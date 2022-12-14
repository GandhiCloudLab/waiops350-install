#!/usr/bin/env bash

function create_crd_installation () {

echo "----------------------------------------------------------------------"
echo "4. Install NOI CRD  (evtmanager) ......."
echo "----------------------------------------------------------------------"
  
cat << EOF | oc apply -f -
apiVersion: noi.ibm.com/v1beta1
kind: NOI
metadata:
  namespace: $EVENT_MANAGER_NAMESPACE
  name: evtmanager
spec:
  version: $EVENT_MANAGER_VERSION
  license:
    accept: true
  advanced:
    antiAffinity: false
    imagePullPolicy: IfNotPresent
    imagePullRepository: cp.icr.io/cp/noi
    ignoreReady: false
    instanceId: iaf-zen-cpdservice
    serviceInstanceName: iaf-zen-cpdservice
    serviceNamespace: $EVENT_MANAGER_NAMESPACE
    storage:
      storageClassName: $EVENT_MANAGER_STORAGE_CLASS
  zen:
    ignoreReady: false
    instanceId: iaf-zen-cpdservice
    #serviceInstanceName: iaf-zen-cpdservice
    #serviceNamespace: cp4waiops
    serviceInstanceName: iaf-zen-cpdservice
    storage:
      storageClassName: '$EVENT_MANAGER_STORAGE_CLASS'
  serviceContinuity:
    continuousAnalyticsCorrelation: false
    isBackupDeployment: false      
  ldap:
    port: '3389'
    mode: standalone
    userFilter: 'uid=%s,ou=users'
    bindDN: 'cn=admin,dc=mycluster,dc=icp'
    sslPort: '3636'
    url: 'ldap://localhost:3389'
    suffix: 'dc=mycluster,dc=icp'
    groupFilter: 'cn=%s,ou=groups'
    baseDN: 'dc=mycluster,dc=icp'
    storageSize: 1Gi
    serverType: CUSTOM
    storageClass: $EVENT_MANAGER_STORAGE_CLASS

  backupRestore:
    enableAnalyticsBackups: false
  topology:
    enable: false
    storageClassElasticTopology: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeElasticTopology: 75Gi
    storageSizeFileObserver: 5Gi
    storageClassFileObserver: $EVENT_MANAGER_STORAGE_CLASS
    iafCartridgeRequirementsName: ''   # cp4waiops-cartridge
    appDisco:
      enabled: false
      scaleSSS: '1'
      tlsSecret: ''
      dbsecret: ''
      db2database: taddm
      dburl: ''
      certSecret: ''
      db2archuser: archuser
      secure: false
      scaleDS: '1'
      db2user: db2inst1
      dbport: '50000'
    observers:
      alm: false
      appdynamics: false
      aws: false
      ansibleawx: false
      azure: false
      bigfixinventory: false
      bigcloudfabric: false
      cienablueplanet: false
      ciscoaci: false
      contrail: false
      dns: false
      docker: false
      dynatrace: false
      file: true
      gitlab: false
      googlecloud: false
      hpnfvd: false
      ibmcloud: false
      itnm: false
      jenkins: false
      junipercso: false
      kubernetes: true
      newrelic: false
      openstack: false
      rancher: false
      rest: true
      sdconap: false
      servicenow: true
      sevone: false
      taddm: false
      viptela: false
      vmvcenter: true
      vmwarensx: false
      zabbix: false
  entitlementSecret: ibm-entitlement-key
  clusterDomain: ''
  integrations:
    humio:
      repository: ''
      url: ''
  persistence:
    storageSizeNCOBackup: 5Gi
    enabled: true
    storageSizeNCOPrimary: 5Gi
    storageClassNCOPrimary: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeImpactServer: 5Gi
    storageClassImpactServer: $EVENT_MANAGER_STORAGE_CLASS
    storageClassKafka: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeKafka: 50Gi
    storageClassCassandraBackup: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeCassandraBackup: 50Gi
    storageClassZookeeper: $EVENT_MANAGER_STORAGE_CLASS
    storageClassCouchdb: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeZookeeper: 5Gi
    storageSizeCouchdb: 20Gi
    storageClassCassandraData: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeCassandraData: 50Gi
    storageClassDB2: $EVENT_MANAGER_STORAGE_CLASS
    storageClassElastic: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeDB2: 5Gi
    storageClassImpactGUI: $EVENT_MANAGER_STORAGE_CLASS
    storageSizeImpactGUI: 5Gi
    storageSizeElastic: 75Gi
    storageClassNCOBackup: $EVENT_MANAGER_STORAGE_CLASS
  deploymentType: trial
EOF

echo "Process completed .... "

}