#hlsdk-2.3 client port for android
#Copyright (c) mittorn

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := client
#ifeq ($(XASH_SDL),1)
#APP_PLATFORM := android-12
#LOCAL_SHARED_LIBRARIES += SDL2 
#LOCAL_CFLAGS += -DXASH_SDL
#else
APP_PLATFORM := android-8
#endif
LOCAL_CONLYFLAGS += -std=c99

include $(XASH3D_CONFIG)

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a-hard)
LOCAL_MODULE_FILENAME = libclient_hardfp
endif

LOCAL_CFLAGS += -fsigned-char -DCLIENT_DLL=1
SRCS :=
SRCS_C :=
SRCS += ../cl_dll/status_icons.cpp
SRCS += ../cl_dll/disc_weapon_disc.cpp
SRCS += ../cl_dll/GameStudioModelRenderer.cpp
SRCS += ../cl_dll/Ricochet_JumpPads.cpp
SRCS += ../cl_dll/StudioModelRenderer.cpp
SRCS += ../cl_dll/ammo.cpp
SRCS += ../cl_dll/ammo_secondary.cpp
SRCS += ../cl_dll/scoreboard_stub.cpp
SRCS += ../cl_dll/input.cpp
SRCS += ../cl_dll/ammohistory.cpp
SRCS += ../cl_dll/battery.cpp
SRCS += ../cl_dll/cdll_int.cpp
SRCS += ../cl_dll/input_xash3d.cpp
SRCS += ../cl_dll/com_weapons.cpp
SRCS += ../cl_dll/death.cpp
SRCS += ../cl_dll/demo.cpp
SRCS += ../cl_dll/entity.cpp
SRCS += ../cl_dll/events.cpp
SRCS += ../cl_dll/ev_common.cpp
SRCS += ../cl_dll/ev_hldm.cpp
SRCS += ../cl_dll/flashlight.cpp
SRCS += ../cl_dll/geiger.cpp
SRCS += ../cl_dll/health.cpp
SRCS += ../cl_dll/hl/hl_baseentity.cpp
SRCS += ../cl_dll/hl/hl_events.cpp
SRCS += ../cl_dll/hl/hl_objects.cpp
SRCS += ../cl_dll/hl/hl_weapons.cpp
SRCS += ../cl_dll/hud.cpp
SRCS += ../cl_dll/hud_msg.cpp
SRCS += ../cl_dll/hud_redraw.cpp
SRCS += ../cl_dll/hud_servers.cpp
SRCS += ../cl_dll/hud_update.cpp
SRCS += ../cl_dll/in_camera.cpp
SRCS += ../cl_dll/menu.cpp
SRCS += ../cl_dll/message.cpp
SRCS += ../cl_dll/saytext.cpp
SRCS += ../cl_dll/statusbar.cpp
SRCS += ../cl_dll/studio_util.cpp
SRCS += ../cl_dll/text_message.cpp
SRCS += ../cl_dll/train.cpp
SRCS += ../cl_dll/tri.cpp
SRCS += ../cl_dll/util.cpp
SRCS += ../cl_dll/view.cpp
SRCS += ../cl_dll/parsemsg.cpp
SRCS += ../../public/interface.cpp
SRCS_C += ../pm_shared/pm_shared.c
SRCS_C += ../pm_shared/pm_math.c
SRCS_C += ../pm_shared/pm_debug.c
INCLUDES =  -I../common -I. -I../game_shared -I../pm_shared -I../engine -I../dlls
DEFINES = -Wno-write-strings -DLINUX -D_LINUX -D_vsnprintf=vsnprintf -Dstricmp=strcasecmp -D_strnicmp=strncasecmp -Dstrnicmp=strncasecmp -DCLIENT_WEAPONS -DCLIENT_DLL -fpermissive -w -DHL_DLL -DRICOCHET_CLIENT_DLL -DRICOCHET_DLL -D_alloca=alloca -D_snprintf=snprintf -DDISABLE_VEC_ORIGIN -DDISABLE_JUMP_ORIGIN

LOCAL_C_INCLUDES := $(LOCAL_PATH)/. $(LOCAL_PATH)/.. \
		 $(LOCAL_PATH)/../../common \
		 $(LOCAL_PATH)/../../engine \
		 $(LOCAL_PATH)/../../game_shared \
		 $(LOCAL_PATH)/../dlls \
		 $(LOCAL_PATH)/../dlls/hl \
		 $(LOCAL_PATH)/../pm_shared \
		 $(LOCAL_PATH)/../../public \
		 $(LOCAL_PATH)/../../public	 \
     
LOCAL_CFLAGS += $(DEFINES) $(INCLUDES)

LOCAL_SRC_FILES := $(SRCS) $(SRCS_C)

include $(BUILD_SHARED_LIBRARY)
