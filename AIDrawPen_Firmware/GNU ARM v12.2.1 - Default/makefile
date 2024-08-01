################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include gecko_sdk_4.4.3/util/third_party/tflite-micro/tensorflow/lite/micro/kernels/cmsis_nn/subdir.mk
-include gecko_sdk_4.4.3/util/third_party/tensorflow_extra/src/subdir.mk
-include gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/subdir.mk
-include gecko_sdk_4.4.3/util/third_party/mbedtls/library/subdir.mk
-include gecko_sdk_4.4.3/util/silicon_labs/silabs_core/memory_manager/subdir.mk
-include gecko_sdk_4.4.3/protocol/bluetooth/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/udelay/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/system/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/sleeptimer/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/power_manager/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/iostream/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/hfxo_manager/src/subdir.mk
-include gecko_sdk_4.4.3/platform/service/device_init/src/subdir.mk
-include gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/subdir.mk
-include gecko_sdk_4.4.3/platform/security/sl_component/sl_protocol_crypto/src/subdir.mk
-include gecko_sdk_4.4.3/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
-include gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/subdir.mk
-include gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_sequencer/subdir.mk
-include gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_power_manager_init/subdir.mk
-include gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/subdir.mk
-include gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/subdir.mk
-include gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/pa-conversions/subdir.mk
-include gecko_sdk_4.4.3/platform/peripheral/src/subdir.mk
-include gecko_sdk_4.4.3/platform/emlib/src/subdir.mk
-include gecko_sdk_4.4.3/platform/emdrv/nvm3/src/subdir.mk
-include gecko_sdk_4.4.3/platform/emdrv/gpiointerrupt/src/subdir.mk
-include gecko_sdk_4.4.3/platform/emdrv/dmadrv/src/subdir.mk
-include gecko_sdk_4.4.3/platform/driver/leddrv/src/subdir.mk
-include gecko_sdk_4.4.3/platform/driver/debug/src/subdir.mk
-include gecko_sdk_4.4.3/platform/driver/button/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/util/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/nn/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/nn/mvp/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/math/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/math/mvp/src/subdir.mk
-include gecko_sdk_4.4.3/platform/compute/driver/mvp/src/subdir.mk
-include gecko_sdk_4.4.3/platform/common/toolchain/src/subdir.mk
-include gecko_sdk_4.4.3/platform/common/src/subdir.mk
-include gecko_sdk_4.4.3/platform/bootloader/app_properties/subdir.mk
-include gecko_sdk_4.4.3/platform/bootloader/api/subdir.mk
-include gecko_sdk_4.4.3/platform/Device/SiliconLabs/EFR32MG24/Source/subdir.mk
-include gecko_sdk_4.4.3/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/subdir.mk
-include gecko_sdk_4.4.3/hardware/driver/imu/src/subdir.mk
-include gecko_sdk_4.4.3/hardware/driver/icm20689/src/subdir.mk
-include gecko_sdk_4.4.3/hardware/driver/configuration_over_swo/src/subdir.mk
-include gecko_sdk_4.4.3/hardware/board/src/subdir.mk
-include gecko_sdk_4.4.3/app/common/util/app_timer/subdir.mk
-include gecko_sdk_4.4.3/app/bluetooth/common/in_place_ota_dfu/subdir.mk
-include gecko_sdk_4.4.3/app/bluetooth/common/gatt_service_pressure/subdir.mk
-include autogen/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := AIDrawPen_Firmware
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: main-build

# Main-build Target
main-build: AIDrawPen_Firmware.axf

# Tool invocations
AIDrawPen_Firmware.axf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C++ Linker'
	arm-none-eabi-g++ -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -T "D:\simplicityProjects\AIDrawPen_Firmware\autogen\linkerfile.ld" -u _printf_float -Wl,--no-warn-rwx-segments --specs=nosys.specs -Xlinker --gc-sections -Xlinker -Map="AIDrawPen_Firmware.map" -mfpu=fpv5-sp-d16 -mfloat-abi=hard --specs=nano.specs -o AIDrawPen_Firmware.axf -Wl,--start-group "./AIDrawPen.o" "./accelerometer.o" "./app.o" "./main.o" "./predictor.o" "./sl_gatt_service_device_information.o" "./autogen/gatt_db.o" "./autogen/sl_bluetooth.o" "./autogen/sl_board_default_init.o" "./autogen/sl_device_init_clocks.o" "./autogen/sl_event_handler.o" "./autogen/sl_iostream_handles.o" "./autogen/sl_iostream_init_eusart_instances.o" "./autogen/sl_power_manager_handler.o" "./autogen/sl_simple_button_instances.o" "./autogen/sl_simple_led_instances.o" "./autogen/sl_tflite_micro_model.o" "./gecko_sdk_4.4.3/app/bluetooth/common/gatt_service_pressure/sl_gatt_service_pressure.o" "./gecko_sdk_4.4.3/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.o" "./gecko_sdk_4.4.3/app/common/util/app_timer/app_timer.o" "./gecko_sdk_4.4.3/hardware/board/src/sl_board_control_gpio.o" "./gecko_sdk_4.4.3/hardware/board/src/sl_board_init.o" "./gecko_sdk_4.4.3/hardware/driver/configuration_over_swo/src/sl_cos.o" "./gecko_sdk_4.4.3/hardware/driver/icm20689/src/sl_icm20689.o" "./gecko_sdk_4.4.3/hardware/driver/imu/src/sl_imu_dcm.o" "./gecko_sdk_4.4.3/hardware/driver/imu/src/sl_imu_fuse.o" "./gecko_sdk_4.4.3/hardware/driver/imu/src/sl_imu_icm20689.o" "./gecko_sdk_4.4.3/hardware/driver/imu/src/sl_imu_math.o" "./gecko_sdk_4.4.3/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/sl_mx25_flash_shutdown.o" "./gecko_sdk_4.4.3/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.o" "./gecko_sdk_4.4.3/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.o" "./gecko_sdk_4.4.3/platform/bootloader/api/btl_interface.o" "./gecko_sdk_4.4.3/platform/bootloader/api/btl_interface_storage.o" "./gecko_sdk_4.4.3/platform/bootloader/app_properties/app_properties.o" "./gecko_sdk_4.4.3/platform/common/src/sl_assert.o" "./gecko_sdk_4.4.3/platform/common/src/sl_slist.o" "./gecko_sdk_4.4.3/platform/common/src/sl_string.o" "./gecko_sdk_4.4.3/platform/common/src/sl_syscalls.o" "./gecko_sdk_4.4.3/platform/common/toolchain/src/sl_memory.o" "./gecko_sdk_4.4.3/platform/compute/driver/mvp/src/sl_mvp.o" "./gecko_sdk_4.4.3/platform/compute/driver/mvp/src/sl_mvp_hal_efr32.o" "./gecko_sdk_4.4.3/platform/compute/driver/mvp/src/sl_mvp_program_area.o" "./gecko_sdk_4.4.3/platform/compute/driver/mvp/src/sl_mvp_util.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_complex_matrix_mult.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_conjugate.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_dot_product.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_magnitude_squared.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_mult.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_add.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_mult.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_scale.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_sub.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_transpose.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_matrix_vector_mult.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_util.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_abs.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_add.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_clamp.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_clip.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_copy.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_dot_product.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_fill.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_mult.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_negate.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_offset.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_scale.o" "./gecko_sdk_4.4.3/platform/compute/math/mvp/src/sl_math_mvp_vector_sub.o" "./gecko_sdk_4.4.3/platform/compute/math/src/sl_math_matrix.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_add.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_conv2d.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_depthwise_conv2d.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_fully_connected.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_mul.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_pooling.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sl_mvp_ml_transpose_conv2d.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sli_mvp_ml_depthwise_conv2d.o" "./gecko_sdk_4.4.3/platform/compute/nn/mvp/src/sli_mvp_ml_depthwise_conv2d_opt.o" "./gecko_sdk_4.4.3/platform/compute/nn/src/sl_nn_util.o" "./gecko_sdk_4.4.3/platform/compute/util/src/sl_compute_util.o" "./gecko_sdk_4.4.3/platform/driver/button/src/sl_button.o" "./gecko_sdk_4.4.3/platform/driver/button/src/sl_simple_button.o" "./gecko_sdk_4.4.3/platform/driver/debug/src/sl_debug_swo.o" "./gecko_sdk_4.4.3/platform/driver/leddrv/src/sl_led.o" "./gecko_sdk_4.4.3/platform/driver/leddrv/src/sl_simple_led.o" "./gecko_sdk_4.4.3/platform/emdrv/dmadrv/src/dmadrv.o" "./gecko_sdk_4.4.3/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o" "./gecko_sdk_4.4.3/platform/emdrv/nvm3/src/nvm3_default_common_linker.o" "./gecko_sdk_4.4.3/platform/emdrv/nvm3/src/nvm3_hal_flash.o" "./gecko_sdk_4.4.3/platform/emdrv/nvm3/src/nvm3_lock.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_acmp.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_burtc.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_cmu.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_core.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_dbg.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_emu.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_eusart.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_gpcrc.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_gpio.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_i2c.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_iadc.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_ldma.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_letimer.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_msc.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_opamp.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_pcnt.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_prs.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_rmu.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_se.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_system.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_timer.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_usart.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_vdac.o" "./gecko_sdk_4.4.3/platform/emlib/src/em_wdog.o" "./gecko_sdk_4.4.3/platform/peripheral/src/peripheral_sysrtc.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o" "./gecko_sdk_4.4.3/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o" "./gecko_sdk_4.4.3/platform/security/sl_component/se_manager/src/sl_se_manager_util.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.o" "./gecko_sdk_4.4.3/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_dcdc_s2.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_emu_s2.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_hfxo_s2.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_lfrco.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_lfxo_s2.o" "./gecko_sdk_4.4.3/platform/service/device_init/src/sl_device_init_nvic.o" "./gecko_sdk_4.4.3/platform/service/hfxo_manager/src/sl_hfxo_manager.o" "./gecko_sdk_4.4.3/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o" "./gecko_sdk_4.4.3/platform/service/iostream/src/sl_iostream.o" "./gecko_sdk_4.4.3/platform/service/iostream/src/sl_iostream_eusart.o" "./gecko_sdk_4.4.3/platform/service/iostream/src/sl_iostream_retarget_stdio.o" "./gecko_sdk_4.4.3/platform/service/iostream/src/sl_iostream_uart.o" "./gecko_sdk_4.4.3/platform/service/power_manager/src/sl_power_manager.o" "./gecko_sdk_4.4.3/platform/service/power_manager/src/sl_power_manager_debug.o" "./gecko_sdk_4.4.3/platform/service/power_manager/src/sl_power_manager_hal_s2.o" "./gecko_sdk_4.4.3/platform/service/sleeptimer/src/sl_sleeptimer.o" "./gecko_sdk_4.4.3/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o" "./gecko_sdk_4.4.3/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.o" "./gecko_sdk_4.4.3/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o" "./gecko_sdk_4.4.3/platform/service/system/src/sl_system_init.o" "./gecko_sdk_4.4.3/platform/service/system/src/sl_system_process_action.o" "./gecko_sdk_4.4.3/platform/service/udelay/src/sl_udelay.o" "./gecko_sdk_4.4.3/platform/service/udelay/src/sl_udelay_armv6m_gcc.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sl_apploader_util_s2.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sl_bt_stack_init.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_accept_list_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_advertiser_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_connection_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_l2cap_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_periodic_adv_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.o" "./gecko_sdk_4.4.3/protocol/bluetooth/src/sli_bt_sync_config.o" "./gecko_sdk_4.4.3/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/cipher.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/cipher_wrap.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/constant_time.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/platform.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/platform_util.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_aead.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_cipher.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_client.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_ecp.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_ffdh.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_hash.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_mac.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_pake.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_rsa.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_se.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_slot_management.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_crypto_storage.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/psa_util.o" "./gecko_sdk_4.4.3/util/third_party/mbedtls/library/threading.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/add.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/conv.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/debug_log.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/depthwise_conv.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/fully_connected.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/mul.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/pooling.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/siliconlabs/transpose_conv.o" "./gecko_sdk_4.4.3/util/third_party/tensorflow_extra/src/sl_tflite_micro_init.o" "./gecko_sdk_4.4.3/util/third_party/tflite-micro/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o" "./gecko_sdk_4.4.3/util/third_party/tflite-micro/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o" "./gecko_sdk_4.4.3/util/third_party/tflite-micro/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.o" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//protocol/bluetooth/bgcommon/lib/libbgcommon_efr32xg24_gcc_release.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//protocol/bluetooth/bgstack/ll/lib/libbluetooth_controller_efr32xg24_gcc_release.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//protocol/bluetooth/lib/libbluetooth_host_efr32xg24_gcc_release.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//util/third_party/cmsis/lib/gcc/cortex-m33/libcmsis-nn.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/nvm3/lib/libnvm3_CM33_gcc.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/autogen/librail_release/librail_efr32xg24_gcc_release.a" "C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk//util/third_party/tensorflow_extra/lib/gcc/cortex-m33/libtflm.a" -lstdc++ -lgcc -lc -lm -lnosys -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building out file: AIDrawPen_Firmware.out'
	arm-none-eabi-objcopy "AIDrawPen_Firmware.axf" "AIDrawPen_Firmware.out"
	@echo ' '

	@echo 'Building hex file: AIDrawPen_Firmware.hex'
	arm-none-eabi-objcopy -O ihex "AIDrawPen_Firmware.axf" "AIDrawPen_Firmware.hex"
	@echo ' '

	@echo 'Building bin file: AIDrawPen_Firmware.bin'
	arm-none-eabi-objcopy -O binary "AIDrawPen_Firmware.axf" "AIDrawPen_Firmware.bin"
	@echo ' '

	@echo 'Building s37 file: AIDrawPen_Firmware.s37'
	arm-none-eabi-objcopy -O srec "AIDrawPen_Firmware.axf" "AIDrawPen_Firmware.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "AIDrawPen_Firmware.axf" -A
	@echo ' '

# Other Targets
clean:
	-@$(foreach FILE, $(CC_DEPS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C++_DEPS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(EXECUTABLES), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(OBJS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C_UPPER_DEPS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(CXX_DEPS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C_DEPS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(CPP_DEPS), $(shell $(RM) $(FILE)) )
	-$(RM) AIDrawPen_Firmware.axf
	-@echo ' '

.PHONY: all clean dependents main-build

-include ../makefile.targets
