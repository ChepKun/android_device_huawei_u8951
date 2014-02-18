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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/huawei/u8951/base.mk)

# Features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# Dalvik params
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Specific
PRODUCT_PROPERTY_OVERRIDES += \
    ro.confg.hw_appfsversion=U8951V4_3_SYSIMG \
    ro.confg.hw_appsbootversion=U8951V4_3_APPSBOOT \
    ro.confg.hw_appversion=U8951V4_3_KERNEL

# Debug
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=G510-0200
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=HuaweiG510-0200
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=orange/G510-0200/hwG510-0200:4.1.1/HuaweiG510-0200/C224B179:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="G510-0200-user 4.1.1 GRJ90 C224B179 release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := u8951
PRODUCT_DEVICE := u8951
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := Ascend G510
