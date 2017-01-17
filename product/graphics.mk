# Graphics
PRODUCT_PACKAGES += \
    libion_exynos \
    libfimg \

PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.force_gpu=1 \
    ro.bq.gpu_to_cpu_unsupported=1
