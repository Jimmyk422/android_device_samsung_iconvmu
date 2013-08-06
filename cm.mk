## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := iconvmu

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/iconvmu/device_iconvmu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := iconvmu
PRODUCT_NAME := cm_iconvmu
PRODUCT_BRAND := samsung
PRODUCT_MODEL := iconvmu
PRODUCT_MANUFACTURER := samsung


