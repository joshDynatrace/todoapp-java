#!/bin/bash

# Build the todoapp
docker build -t todoapp-java .

# Run the todo app
docker run -p 8080:8080 todoapp-java &

# Download the Dynatrace OneAgent installer
# wget -O Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh \
#  "https://arn95277.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86" \
#  --header="Authorization: Api-Token $DT_API_TOKEN"

# Run the installer
# chmod +x Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh
# sudo ./Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh --set-monitoring-mode=discovery --set-app-log-content-access=true

docker run -d
--restart=on-failure:5
--read-only=true
--pid=host
--net=host
--cap-drop ALL
--cap-add CHOWN
--cap-add DAC_OVERRIDE
--cap-add DAC_READ_SEARCH
--cap-add FOWNER
--cap-add FSETID
--cap-add KILL
--cap-add NET_ADMIN
--cap-add NET_RAW
--cap-add SETFCAP
--cap-add SETGID
--cap-add SETUID
--cap-add SYS_ADMIN
--cap-add SYS_CHROOT
--cap-add SYS_PTRACE
--cap-add SYS_RESOURCE
--security-opt apparmor:unconfined
-v /:/mnt/root
-v <volume name>:/mnt/volume_storage_mount
-e ONEAGENT_ENABLE_VOLUME_STORAGE=true
-e ONEAGENT_INSTALLER_SCRIPT_URL=https://arn95277.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86
-e ONEAGENT_INSTALLER_DOWNLOAD_TOKEN=$DT_API_TOKEN
dynatrace/oneagent --set-monitoring-mode=discovery --set-app-log-content-access=true

# forward all traffic to 8080 on the local machine
# nohup kubectl port-forward deployment/frontend 8080:8080 &
