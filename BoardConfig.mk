#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common msm7x27a definitions
include device/huawei/msm7x27a-common/BoardConfig.mk

# OTA
TARGET_OTA_ASSERT_DEVICE := u8951,G510

# Architecture and CPU
TARGET_CPU_SMP := true

# Kernel
TARGET_KERNEL_CONFIG := u8951_defconfig
TARGET_BOOTLOADER_BOARD_NAME := U8951

KERNEL_EXTERNAL_MODULES:
	mkdir -p $(TARGET_ROOT_OUT)/wifi
	rm -rf $(TARGET_OUT_INTERMEDIATES)/ath6kl
	cp -a device/huawei/u8951/hardware/wifi/ath6kl $(TARGET_OUT_INTERMEDIATES)/
	$(MAKE) -C $(TARGET_OUT_INTERMEDIATES)/ath6kl/cfg80211 KERNEL_OUT=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" modules
	$(MAKE) -C $(TARGET_OUT_INTERMEDIATES)/ath6kl/ar6000 KERNEL_OUT=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" modules
	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/ath6kl/cfg80211/cfg80211.ko $(TARGET_ROOT_OUT)/wifi/cfg80211.ko
	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/ath6kl/ar6000/ar6000.ko $(TARGET_ROOT_OUT)/wifi/ar6000.ko

TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

# Audio
TARGET_HAS_QACT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/u8951/configs/bdroid

# RIL
BOARD_RIL_CLASS := ../../../device/huawei/u8951/include/android/ril/

# Wi-Fi
BOARD_HAS_ATH_WLAN := true
BOARD_HAVE_HUAWEI_WIFI := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_DRIVER_FW_PATH_AP 	:= "ap"
WIFI_TEST_INTERFACE	:= "sta"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_NAME := "ar6000"
WIFI_DRIVER_MODULE_PATH := "/data/misc/wifi/load/ar6000.ko"

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1058320384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1190596608

# Recovery TWRP
DEVICE_RESOLUTION := 480x854
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/u8951/recovery/graphics.c
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/u8951/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/huawei/u8951/recovery/recovery.fstab
