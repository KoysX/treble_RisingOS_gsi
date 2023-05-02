$(call inherit-product, vendor/lineage/config/common.mk)
$(call inherit-product, vendor/lineage/config/BoardConfigSoong.mk)
$(call inherit-product, vendor/lineage/config/BoardConfigLineage.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)

# Inherit some common Ricedroid stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
-include vendor/lineage/build/core/config.mk

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL_IMAGE := true
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true
TARGET_DISABLE_BLUETOOTH_LE_READ_BUFFER_SIZE_V2 := true

# Google Camera Lite
PRODUCT_PACKAGES += \
       GoogleCameraGo
       
# Rice
RISING_MAINTAINER := Kuaipz
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_HAS_UDFPS := true
TARGET_USE_PIXEL_FINGERPRINT := false
TARGET_EXCLUDES_AUDIOFX := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BUILD_APERTURE_CAMERA := true
WITH_GMS := true
TARGET_USE_GOOGLE_TELEPHONY := false
TARGET_USE_PIXEL_FINGERPRINT := true
