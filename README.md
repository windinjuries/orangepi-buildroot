## buildroot 

### version
buildroot-2024.02.9

### build process 
```
make orangepi_zero3_defconfig
make menuconfig 
make
make linux-menuconfig
```
### menu config
1. [Enable] System Configuration -> Init system(systemd)
2. [Enable] Toolchain -> support C++
3. [Enable] Toolchain -> (libstdc++) Extra toolchain libraries to be copied to target



### ETH
增加 board/orangepi/orangepi-zero3/overlay/etc/systemd/network/end0.network

### GPIO
- linux kernel config
    1. [Enable] General Setup -> Configure standard kernel features(expert users)
    2.  [Enable] Device Drive -> GPIO Support -> /sys/class/gpio.. (sysfs interface)

### LED
- linux kernel config  
    1. [Enable] Device Drive -> LED Support -> LED Trigger Support -> Timer Trigger
    2. [Enable] Device Drive -> LED Support -> LED Trigger Support -> Transient Trigger


### User App
1. overlay
将可执行文件放在board/orangepi/orangepi-zero3/overlay/root
2. post-build
在打包前执行脚本使能服务自启动
