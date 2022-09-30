#!/usr/bin/env bash

source ./00-config.sh

source ./common/01-pre-install.sh
source ./common/02-create-subscription.sh
source ./common/03-webhook-probe.sh

install_main() {

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " Generic Webhook creation with AI Manager started ....$date1"
  echo "******************************************************************************************"
  
  install_preinstall
  create_subscription
  install_probe

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " Generic Webhook creation with AI Manager completed ....$date1"
  echo "******************************************************************************************"
}

install_main