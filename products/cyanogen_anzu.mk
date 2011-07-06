# Inherit device configuration for anzu.
$(call inherit-product, device/semc/anzu/device_anzu.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_anzu
PRODUCT_BRAND := semc
PRODUCT_DEVICE := anzu
PRODUCT_MODEL := Sony Ericsson Xperia Arc
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT15i BUILD_ID=3.0.A.2.181 BUILD_DISPLAY_ID=3.0.A.2.181 BUILD_FINGERPRINT=SEMC/LT15i_1247-1061/LT15i:2.3.2/3.0.A.2.181/SvfP:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.2 3.0.A.2.181 SvfP test-keys"

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/ti_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-anzu
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-anzu
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-anzu-FXP012
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

CYANOGEN_WITH_GOOGLE := true