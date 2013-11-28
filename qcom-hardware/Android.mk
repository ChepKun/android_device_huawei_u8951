LOCAL_PATH:= $(call my-dir)
LOCAL_DIR_PATH:= $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/display-legacy/Android.mk
LOCAL_PATH := $(LOCAL_DIR_PATH)

include $(LOCAL_PATH)/media-legacy/Android.mk
LOCAL_PATH := $(LOCAL_DIR_PATH)

