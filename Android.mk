LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),u8951)
    include $(call all-makefiles-under,$(LOCAL_PATH))
endif
