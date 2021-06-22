#!/bin/sh

docker build -t piejam_os_builder .
docker create --name piejam_os_rpi4 piejam_os_builder /bin/bash -c "make -C piejam_os raspberrypi4-source; tar cfz piejam_os_rpi4.tgz piejam_os; make -C piejam_os raspberrypi4"
docker start -i piejam_os_rpi4
docker cp piejam_os_rpi4:/home/builder/piejam_os_rpi4.tgz .
docker cp piejam_os_rpi4:/home/builder/piejam_os/br2_external/output/raspberrypi4/images/sdcard.img raspberrypi4.img
docker rm piejam_os_rpi4
docker image rm piejam_os_builder
