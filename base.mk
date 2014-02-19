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

# Inherit the msm7x27a-common definitions
$(call inherit-product, device/huawei/msm7x27a/msm7x27a.mk)

# Include vendor blobs
$(call inherit-product-if-exists, vendor/huawei/u8951/vendor-blobs.mk)

# Include configs
$(call inherit-product, device/huawei/u8951/configs/configs.mk)

# Include input
$(call inherit-product, device/huawei/u8951/input/input.mk)

# Include ramdisk
$(call inherit-product, device/huawei/u8951/ramdisk/ramdisk.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/huawei/u8951/overlay

# Specific
PRODUCT_PACKAGES += \
    Torch

# Network
PRODUCT_PACKAGES += \
    libbt-vendor

# Features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

#signalstrength
# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    gsm.version.baseband=2030 \
    ro.telephony.ril.v3=qcomdsds,skippinpukcount \
    ro.telephony.ril_class=HuaweiRIL \
    persist.multisim.config=none \
    ro.config.dualmic=true

# Call product build config
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Languages
PRODUCT_LOCALES := ru_RU en_US
