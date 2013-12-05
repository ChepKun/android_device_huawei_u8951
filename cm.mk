# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

CM_BUILDTYPE := NIGHTLY

# Correct boot animation size for the screen
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Specify phone tech before including full_phone
$(call inherit-product, vendor/yamato/config/gsm.mk)

# Inherit some common stuff
$(call inherit-product, vendor/yamato/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/u8951/u8951.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := u8951
PRODUCT_NAME := cm_u8951
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Ascend G510
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RELEASE_NAME := u8951

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=G510-0200
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=HuaweiG510-0200
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=orange/G510-0200/hwG510-0200:4.1.1/HuaweiG510-0200/C224B179:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="G510-0200-user 4.1.1 GRJ90 C224B179 release-keys"
