#!/bin/sh

docker build -t piejam_os_builder .
docker create --name piejam_os_rpi3 piejam_os_builder make raspberrypi3
docker start -i piejam_os_rpi3
docker cp piejam_os_rpi3:/home/builder/piejam_os/br2_external/output/raspberrypi3/images/sdcard.img .
docker rm piejam_os_rpi3
