$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/iconvmu/iconvmu-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/iconvmu/overlay
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

LOCAL_PATH := device/samsung/iconvmu

$(call inherit-product, build/target/product/full.mk)

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_NAME := cm_iconvmu
PRODUCT_DEVICE := iconvmu

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Audio
PRODUCT_PACKAGES += \
	libaudio \
	libaudiopolicy \
	libcamera \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.$(TARGET_BOARD_PLATFORM) \
    audio.primary.$(TARGET_BOARD_PLATFORM)
    
# HAL
PRODUCT_PACKAGES += \
	copybit.$(TARGET_BOARD_PLATFORM) \
	gralloc.$(TARGET_BOARD_PLATFORM) \
	hwcomposer.$(TARGET_BOARD_PLATFORM) \
	power.$(TARGET_BOARD_PLATFORM) \
	lights.$(TARGET_BOARD_PLATFORM)

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libI420colorconvert
    
# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs
	
	
	
# MFC API
#PRODUCT_PACKAGES += \
#    libsecmfcdecapi \
#    libsecmfcencapi

# Live Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
    
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/init.target.rc:root/init.target.rc \
	$(LOCAL_PATH)/root/init.qcom.ril.path.sh:root/init.qcom.ril.path.sh \
	$(LOCAL_PATH)/root/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/root/fstab.qcom:root/fstab.qcom \
	$(LOCAL_PATH)/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/root/init.bt.rc:root/init.bt.rc \
	$(LOCAL_PATH)/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
	$(LOCAL_PATH)/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
	$(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/root/init.qcom.rc:root/init.qcom.rc \
	$(LOCAL_PATH)/recovery.fstab:root/recovery.fstab
	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/scripts/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
	$(LOCAL_PATH)/scripts/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
	$(LOCAL_PATH)/scripts/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
	$(LOCAL_PATH)/scripts/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	$(LOCAL_PATH)/scripts/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
	$(LOCAL_PATH)/scripts/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	$(LOCAL_PATH)/scripts/init.qcom.coex.sh:system/etc/init.qcom.coex.sh

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keychars/surf_keypad.kcm:system/usr/keychars/surf_keypad.kcm
		
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl \
	$(LOCAL_PATH)/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
	$(LOCAL_PATH)/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	$(LOCAL_PATH)/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	$(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
	$(LOCAL_PATH)/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
	$(LOCAL_PATH)/keylayout/icon-keypad.kl:system/usr/keylayout/icon-keypad.kl \
	$(LOCAL_PATH)/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/thermald.conf:system/etc/thermald.conf \
	$(LOCAL_PATH)/config/vold.fstab:system/etc/configs/vold.fstab \
	$(LOCAL_PATH)/config/vold.conf:system/etc/configs/vold.conf \
	$(LOCAL_PATH)/config/gps.xml:system/etc/configs/gps.xml \
	$(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/configs/wpa_supplicant.conf

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
