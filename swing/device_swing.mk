$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/acer/swing/overlay

# Telephony permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# RIL packages
PRODUCT_PACKAGES += \
    libtime_genoff

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-acer-qmi-1.so \
    ro.telephony.ril_class=SonyRIL \
    ro.ril.telephony.mqanelements=5 \
    ro.ril.transmitpower=true

# QMI properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    persist.data.qmi.adb_logmask=0

# Radio properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    telephony.lteOnCdmaDevice=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0


# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so

# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml


# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/acer-input.idc:system/usr/idc/acer-input.idc \
    $(LOCAL_PATH)/configs/cypress-ts.idc:system/usr/idc/cypress-ts.idc \
    $(LOCAL_PATH)/configs/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl 

$(call inherit-product-if-exists, vendor/acer/swing/swing-vendor.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# EGL config
#PRODUCT_COPY_FILES += \
#    device/acer/swing/configs/egl.cfg:system/lib/egl/egl.cfg


# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# We have enough space to hold precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
#PRODUCT_LOCALES += en_US hdpi

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8960

# Libril
PRODUCT_PACKAGES += \
    libril

# Camera
#PRODUCT_PACKAGES += \
#    camera.msm8960

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# OMX
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
#PRODUCT_PACKAGES += \
#    power.msm8960

# HDMI
#PRODUCT_PACKAGES += \
#    hdmid

# QCOM rngd
#PRODUCT_PACKAGES += \
#    qrngd

# USB
#PRODUCT_PACKAGES += \
#    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs

PRODUCT_COPY_FILES += \
    device/acer/swing/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/acer/swing/configs/audio_effects.conf:system/etc/audio_effects.conf \
    device/acer/swing/configs/media_codecs.xml:system/etc/media_codecs.xml

# CNE config
#PRODUCT_COPY_FILES += \
#   device/acer/swing/configs/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
#   device/acer/swing/configs/UserPolicy.xml:system/etc/UserPolicy.xml
  
# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/acer/swing/keychars/keypad_swing_qwerty.kcm:system/usr/keychars/keypad_swing_qwerty.kcm \
    device/acer/swing/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl 

# ALSA configuration
#PRODUCT_COPY_FILES += \
#    device/acer/swing/configs/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/thermald.conf:system/etc/thermald.conf

# wifi config
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf 
	
# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

#QCOM Display overrides
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=true

# Audio overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sdk.audio.fluencetype=none \
    ro.qualcomm.bt.hci_transport=smd
