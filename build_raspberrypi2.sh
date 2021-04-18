#!/bin/sh

docker build -t piejam_os_builder .
docker create --name piejam_os_rpi2 piejam_os_builder make raspberrypi2
docker start -i piejam_os_rpi2
docker cp piejam_os_rpi2:/home/builder/piejam_os/br2_external/output/raspberrypi2/images/sdcard.img .
docker rm piejam_os_rpi2
