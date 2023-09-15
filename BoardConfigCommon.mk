#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amlogic/gxl-common

## BUILD_BROKEN_*
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# GPU
TARGET_AMLOGIC_GPU_ARCH := bifrost

## HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

## Kernel
BOARD_KERNEL_CMDLINE := androidboot.dynamic_partitions=true androidboot.boot_devices=ffe07000.emmc use_uvm=1
TARGET_KERNEL_CONFIG := g12a_defconfig
TARGET_KERNEL_SOURCE := kernel/amlogic/linux-4.9
TARGET_KERNEL_VARIANT_CONFIG ?= g12a_variant_defconfig

## Partitions
CORE_PARTITIONS := system vendor
ADDITIONAL_PARTITIONS := odm
ALL_PARTITIONS := $(CORE_PARTITIONS) $(ADDITIONAL_PARTITIONS)

BOARD_ODMIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

## Properties
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

## Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init-files/fstab.amlogic

## Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

## Vendor SPL
VENDOR_SECURITY_PATCH := 2021-11-05

## Include the main common tree BoardConfig makefile
include device/amlogic/common/BoardConfigAmlogic.mk

## Include the common proprietary BoardConfig makefile
include vendor/amlogic/gxl-common/BoardConfigVendor.mk
