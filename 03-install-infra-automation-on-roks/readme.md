# Installing Watson AIOps Infra Automation 3.5 on ROKS

This document explains about Installing IBM Watson AIOps Infra Automation 3.5.0 on ROKS.

Installation scripts are available here [files](./files).


## 1. Update Properties

Update the below properties in `files/00-config.sh` file .


#### 1.1 Update entitlement Keys

```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
```

#### 1.2 Update LDAP User Group

```
export YOUR_LDAP_USER_GROUP=IM_GROUP
```

## 2. Install Infra-Automation

#### 2.1. Login to OCP Cluster

Login to OCP cluster using  `oc login` command .

#### 2.2. Run the install script

Goto the `files` folder and Run the install script as like below.

```
cd files
sh 10-install.sh
```

- It would take around 1hr to complete the istallation. 
- By default the installation is done on the namespace `cp4waiops`
- Keep checking the logs for the status. 
- The same script can be run again and again if the install stopped for any reason.

#### 2.3. Output
 
The installation would be completed and the output could be like this.

```
=====================================================================================================
URL : https://cpd-cp4waiops.aaaaaaaa.ams03.containers.appdomain.cloud
USER: admin
PASSWORD: EpU2m........................jYUz
=====================================================================================================

```

You can use this to login into the WAIOps Console.

## 3. Printing URL, Usr and Pwd

To get the Infra Automation URL, user and password anytime after Infra Automation install, you can run the below command. This will print the output as like above.

```
cd files
sh 19-print-url-usr-pwd.sh
```

## Reference

The script is based out of the following.

- Online installation of Infrastructure Automation
https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.5.0?topic=automation-online-installation
## Note

This script can be installed on top existing IBM Watson AIOps AI Manager 3.5.0 instance.
