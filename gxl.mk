#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio@7.0-util.vendor \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.effect@7.0-util.vendor \
    av-types-aidl-cpp.vendor \
    libaudioclient_aidl_conversion_util.vendor \
    libaudiofoundation.vendor

## Bluetooth
ifneq ($(BOARD_HAVE_BLUETOOTH),false)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor
endif

## Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.5-legacy \
    android.hardware.camera.provider@2.5-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    camera.device@3.3-impl \
    camera.device@3.4-impl \
    camera.device@3.5-impl

## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

ifneq ($(PRODUCT_USE_SW_OMX),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif

## dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1.vendor

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4.vendor

## Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1.vendor

# Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/fstab.amlogic:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.amlogic \
    $(LOCAL_PATH)/init-files/init.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.media.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    $(LOCAL_PATH)/init-files/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc \
    $(LOCAL_PATH)/init-files/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

## Kernel Modules
PRODUCT_PACKAGES += \
    mali \
    media \
    optee-module

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml \
    lib_android_keymaster_keymint_utils.vendor \
    libkeymint.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    libpuresoftkeymasterdevice.vendor \
    libshmemutil.vendor \
    libshmemcompat.vendor \
    libsoft_attestation_cert.vendor \
    libtrusty.vendor

ifeq ($(TARGET_HAS_TEE),false)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service
endif

## Permissions
PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

## Platform
TARGET_AMLOGIC_SOC ?= gxl

## Power
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock

## Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

## USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.2.vendor

## Inherit from the main common tree product makefile
$(call inherit-product, device/amlogic/common/amlogic.mk)

## Inherit from the common proprietary files makefile
$(call inherit-product, vendor/amlogic/gxl-common/gxl-common-vendor.mk)
