#
# Component Cmake
#
message("Enter component.cmake")

if(CONFIG_STDK_IOT_CORE)
	set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include include/bsp include/os include/mqtt)
	set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/external)

	if(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_ESP8266)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/esp8266)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/esp8266)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_ESP32)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/esp32)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/esp32)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_RTL8195)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/rtl8195)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/rtl8195)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_RTL8720C)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/rtl8720c)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/rtl8720c)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_RTL8721C)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/rtl8721c)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/rtl8721c)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_MT7682)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/mt7682)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/mt7682)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_EMW3166)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/emw3166)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/emw3166)
	elseif(CONFIG_STDK_IOT_CORE_BSP_SUPPORT_LPC54018)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/lpc54018)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/lpc54018)
	else()
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/bsp/posix)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" include/bsp/posix)
	endif()

	set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" port/net)
	if(CONFIG_STDK_IOT_CORE_USE_MBEDTLS)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/net/mbedtls)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" port/net/mbedtls)
	else()
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/net/openssl)
		set(STDK_INCLUDE_PATH "${STDK_INCLUDE_PATH}" port/net/openssl)
	endif()




	if(CONFIG_STDK_IOT_CORE_OS_SUPPORT_FREERTOS)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/os/freertos)
	elseif(CONFIG_STDK_IOT_CORE_OS_SUPPORT_TIZENRT)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/os/tizenrt)
	elseif(CONFIG_STDK_IOT_CORE_OS_SUPPORT_POSIX)
		set(STDK_SRC_PATH "${STDK_SRC_PATH}" port/os/posix)
	endif()

	set(STDK_SRC_PATH "${STDK_SRC_PATH}" security)
	set(STDK_SRC_PATH "${STDK_SRC_PATH}" easysetup)
	set(STDK_SRC_PATH "${STDK_SRC_PATH}" mqtt)


	#include_directories(include/iot_common.h)



	set(CMAKE_C_STANDARD 99)
else()
	message("Fail to find SDK config")
# Disable SmartThing Device SDK support
	set(STDK_INCLUDE_PATH "")
	set(STDK_SRC_PATH "")
endif()
