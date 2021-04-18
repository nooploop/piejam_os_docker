# PieJam OS Docker Builder
This is a `Docker` environment which allows you to build a `PieJam OS` image.
It might be helpful if you have problems with building the image with
your regular Linux distribution or when you dont want to pollute your
system with any kind of building packages.

## Requirements
You need a running `Docker` service on your system. Consult the documentation
of your system how to install and configure `Docker`.

## How to
* Clone the repository:
  ```
  git clone https://github.com/nooploop/piejam_os_docker.git
  ```
* Change working directory to cloned repository:
  ```
  cd piejam_os_docker
  ```
* Run the build script for desired target. Docker requires root privileges so you need to run the build script with `sudo`:
  * Raspberry Pi 2B
    ```
    sudo sh build_raspberrypi2.sh
    ```
  * Raspberry Pi 3B
    ```
    sudo sh build_raspberrypi3.sh
    ```
* The build process might take awhile. After the build is finished you will find an image file in the working directory. You can flash it onto a microSD card:
  ```
  dd if=sdcard.img of=/dev/sdX
  ```
  Replace `/dev/sdX` with the device for your microSD card.