# Copyright (C) 2011 The Android Open-Source Project
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

-include vendor/huawei/u8951/BoardConfigVendor.mk

# OTA
TARGET_OTA_ASSERT_DEVICE := u8951,G510

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_USES_ION := true

# Note: use cortex-a9 to take advantage of NEON optimizations
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

TARGET_GLOBAL_CFLAGS += -O3 -mtune=cortex-a9 -ftree-vectorize -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -O3 -mtune=cortex-a9 -ftree-vectorize -mfpu=neon -mfloat-abi=softfp

# Optimizations
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HIGH_OPTIMIZATION := true

# Kernel 
TARGET_KERNEL_SOURCE := kernel/huawei/u8951
TARGET_KERNEL_CONFIG := cm_msm8x25_defconfig
TARGET_BOOTLOADER_BOARD_NAME := U8951
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei
BOARD_KERNEL_BASE := 0x00200000
BOARD_PAGE_SIZE := 2048
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_SPECIFIC_HEADER_PATH := device/huawei/u8951/include

# Graphics
BOARD_EGL_CFG := device/huawei/u8951/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
BOARD_USE_SKIA_LCDTEXT := true

# Video
BUILD_WITH_FULL_STAGEFRIGHT := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# FM Radio
# BOARD_HAVE_FM_RADIO := true
# BOARD_HAVE_QCOM_FM := true
# BOARD_FM_DEVICE := bcm4330
# BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USE_QCOM_LLVM_CLANG_RS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Wi-Fi
BOARD_WLAN_DEVICE                := ath6kl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_HOSTAPD_DRIVER             := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_MODULE_PATH          := "/data/misc/wifi/load/ar6000.ko"
WIFI_DRIVER_MODULE_NAME          := "ar6000"
WIFI_TEST_INTERFACE              := "sta"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
BOARD_HAVE_HUAWEI_WIFI := true

# Audio
TARGET_PROVIDES_LIBAUDIO := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
USE_CAMERA_STUB := false
BOARD_NEEDS_MEMORYHEAPPMEM := true

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Web Rendering
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/huawei/u8951/recovery/kernel
TARGET_RECOVERY_INITRC := device/huawei/u8951/recovery/init.rc
TARGET_RECOVERY_FSTAB := device/huawei/u8951/recovery/etc/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/u8951/recovery/recovery-keys.c
DEVICE_RESOLUTION := 480x800
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_10x18.h\"

# USB
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Partitions
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p17
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1058320384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1190596608
BOARD_FLASH_BLOCK_SIZE := 131072

# Skip docs from building
BOARD_SKIP_ANDROID_DOC_BUILD := true
