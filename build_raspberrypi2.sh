#!/bin/sh

docker build -t piejam_os_builder .
docker create --name piejam_os_rpi2 piejam_os_builder /bin/bash -c "make -C piejam_os raspberrypi2-source; tar cfz piejam_os_rpi2.tgz piejam_os; make -C piejam_os raspberrypi2"
docker start -i piejam_os_rpi2
docker cp piejam_os_rpi2:/home/builder/piejam_os_rpi2.tgz .
docker cp piejam_os_rpi2:/home/builder/piejam_os/br2_external/output/raspberrypi2/images/sdcard.img raspberrypi2.img
docker rm piejam_os_rpi2
docker image rm piejam_os_builder
