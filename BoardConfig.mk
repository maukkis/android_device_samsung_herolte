#
# Copyright (C) 2019 The LineageOS Project
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
# I FUCKING HATE SELINUX
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
# inherit from common
include device/samsung/universal8890-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/herolte

# Assert
TARGET_OTA_ASSERT_DEVICE := heroltebmc,herolteskt,heroltektt,heroltelgt,heroltexx,herolte

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Fingerprint
TARGET_SEC_FP_USES_PERCENTAGE_SAMPLES := true

# Init
TARGET_INIT_VENDOR_LIB :=  //$(DEVICE_PATH):libinit_herolte

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/universal8890
TARGET_KERNEL_CONFIG := exynos8890-herolte_defconfig

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libbauthserver.so|/vendor/lib/libbauthtzcommon_shim.so \
    /vendor/lib64/libbauthserver.so|/vendor/lib64/libbauthtzcommon_shim.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-04-01

# inherit from the proprietary version
include vendor/samsung/herolte/BoardConfigVendor.mk
