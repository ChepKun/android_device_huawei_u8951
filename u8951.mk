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

# Languages
PRODUCT_LOCALES := ru_RU en_US

# Screen scale
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The GPS configuration appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Include configs
$(call inherit-product, device/huawei/u8951/configs/configs.mk)

# Include input
$(call inherit-product, device/huawei/u8951/input/input.mk)

# Include ramdisk
$(call inherit-product, device/huawei/u8951/ramdisk/ramdisk.mk)

# Include recovery
$(call inherit-product, device/huawei/u8951/recovery/recovery.mk)

# Include scripts
$(call inherit-product, device/huawei/u8951/scripts/scripts.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/huawei/u8951/overlay

# Tags
PRODUCT_TAGS += dalvik.gc.type-precise

# Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.usb.default \
    libaudioutils

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a \
    libloc_api-rpc

# Lights	
PRODUCT_PACKAGES += \
    lights.msm7x27a

# FM
PRODUCT_PACKAGES += \
    libqcomfm_jni \
    qcom.fmradio

# Network
PRODUCT_PACKAGES += \
    hwmac
	
# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    make_ext4fs \
    setup_fs \
    Torch \
    com.android.future.usb.accessory

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Write properties

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.remote.autoconnect=true \
    ro.bluetooth.request.master=true \
    ro.qualcomm.bluetooth.dun=true \
    ro.qualcomm.bluetooth.ftp=true

# FM Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=false \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false

# Recovery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.hwc.dynThreshold=1.9 \
    debug.composition.type=dyn \
    ro.max.fling_velocity=4000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=240

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=0 \
    ro.config.dualmic=true

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \

# Memory
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=0 \
    persist.sys.purgeable_assets=1 \
    sys.mem.max_hidden_apps=10

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    persist.thermal.monitor=true \
    ro.hw_plat=7x27A

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    rild.libargs=-d[SPACE]/dev/smd0 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.ril_class=HuaweiRIL \
    ro.telephony.ril.v3=qcomdsds,skippinpukcount \
    ril.subscription.types=NV,RUIM \
    gsm.version.baseband=2030 \
    ro.telephony.call_ring.delay=0 \
    DEVICE_PROVISIONED=1

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.vold.umsdirtyratio=50

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=60

# Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.media.enc.jpeg.quality=100 \
    persist.sys.use_dithering=0 \
    windowsmgr.max_events_per_sec=150 \
    dalvik.vm.debug.alloc=0

# Huawei
PRODUCT_PROPERTY_OVERRIDES += \
    ro.confg.hw_appfsversion=U8951_CM10.1_SYSIMG \
    ro.confg.hw_appsbootversion=U8951_CM10.1_APPSBOOT \
    ro.confg.hw_appversion=U8951_CM10.1_KERNEL

# Dalvik params
$(call inherit-product-if-exists, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
	
# Call product build config
$(call inherit-product, build/target/product/full.mk)

# Vendor blobs
$(call inherit-product, vendor/huawei/u8951/vendor-blobs.mk)

PRODUCT_NAME := u8951
PRODUCT_DEVICE := u8951
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := Ascend G510
