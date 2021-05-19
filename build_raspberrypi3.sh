#!/bin/sh

docker build -t piejam_os_builder .
docker create --name piejam_os_rpi3 piejam_os_builder /bin/bash -c "make -C piejam_os raspberrypi3-source; tar cfz piejam_os_rpi3.tgz piejam_os; make -C piejam_os raspberrypi3"
docker start -i piejam_os_rpi3
docker cp piejam_os_rpi3:/home/builder/piejam_os_rpi3.tgz .
docker cp piejam_os_rpi3:/home/builder/piejam_os/br2_external/output/raspberrypi3/images/sdcard.img raspberrypi3.img
docker rm piejam_os_rpi3
docker image rm piejam_os_builder
