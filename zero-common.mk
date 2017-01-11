#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/zero-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay

ifneq ($(filter zerofltespr zeroltespr,$(TARGET_DEVICE)),)
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay-cdma
else
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay-gsm
endif

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.samsungexynos7420 \
    init.baseband.rc \
    init.bluetooth.rc \
    init.gps.rc \
    init.samsungexynos7420.rc \
    init.samsungexynos7420.usb.rc \
    init.wifi.rc \
    ueventd.samsungexynos7420.rc

# Gello
PRODUCT_PACKAGES += \
    Gello

# Lights
PRODUCT_PACKAGES += \
    lights.universal7420

# Libstlport
PRODUCT_PACKAGES += \
    libstlport

# LiveDisplay native
PRODUCT_PACKAGES += \
    libjni_livedisplay

# Power
PRODUCT_PACKAGES += \
    power.universal7420

# Shims
PRODUCT_PACKAGES += \
    libshim_gpsd

# Widevine
PRODUCT_PACKAGES += \
    libshim_wvm

# Include package config fragments
include $(LOCAL_PATH)/product/*.mk

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos7420/exynos7420.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/zero-common/zero-common-vendor.mk)
