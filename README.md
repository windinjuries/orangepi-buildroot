# buildroot-2024.02.9
## buildroot 
```
make orangepi_zero3_defconfig
make menuconfig 
make
```
## menu config
1. 使能 `systemd` 启动


## custom config
### ETH
增加 board/orangepi/orangepi-zero3/overlay/etc/systemd/network/end0.network

### GPIO

linux kernel 使能 sys

### WIFI
