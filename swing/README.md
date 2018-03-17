android_device_acer_swing
========================

Android device tree for ACER Swing (CloudMobile) - Jellybean Branch


To fix display, add this

common_flags += -DQCOM_BSP

at bottom of hardware/qcom/display/common.mk

