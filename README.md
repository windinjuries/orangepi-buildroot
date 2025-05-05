## orangepi-zero3 buildroot 

### version
buildroot-2024.02.9

### build 
```bash
make orangepi_zero3_defconfig
make menuconfig 
make

# change linux kernel and device tree
make linux-menuconfig
make linux-rebuild
```

### menu config
- [Enable] System Configuration -> Init system(systemd)
- [Enable] Toolchain -> support C++
- [Enable] Toolchain -> (libstdc++) Extra toolchain libraries to be copied to target

### ETH
增加 board/orangepi/orangepi-zero3/overlay/etc/systemd/network/end0.network

### GPIO
- linux kernel config
    - [Enable] General Setup -> Configure standard kernel features(expert users)
    -  [Enable] Device Drive -> GPIO Support -> /sys/class/gpio.. (sysfs interface)

### LED
- linux kernel config  
    - [Enable] Device Drive -> LED Support -> LED Trigger Support -> Timer Trigger
    - [Enable] Device Drive -> LED Support -> LED Trigger Support -> Transient Trigger

### SPI
- linux kernel config  
    - [Enable] Device Drive -> SPI Support -> Use mode SPI device driver support  
- device tree config
    - add spidev node
```dts
&spi0  {
	status = "okay";
	pinctrl-names = "default";
	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;

	spidev@0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "spidev";
		reg = <0>;
		spi-max-frequency = <1000000>;
	};
};
```
[sunxi spi config reference](https://linux-sunxi.org/SPIdev)

### User App
1. overlay
将可执行文件放在board/orangepi/orangepi-zero3/overlay/root
2. post-build
在打包前执行脚本使能服务自启动
