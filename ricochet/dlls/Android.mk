#hlsdk-2.3 client port for android
#Copyright (c) mittorn

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := server
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
LOCAL_MODULE_FILENAME = libserver_hardfp
endif

LOCAL_CFLAGS += -fsigned-char
SRCS :=
SRCS_C :=
TOPDIR := .
SRCS += $(TOPDIR)/../dlls/airtank.cpp
SRCS += $(TOPDIR)/../dlls/animating.cpp
SRCS += $(TOPDIR)/../dlls/animation.cpp 
SRCS += $(TOPDIR)/../dlls/bmodels.cpp 
SRCS += $(TOPDIR)/../dlls/buttons.cpp 
SRCS += $(TOPDIR)/../dlls/cbase.cpp 
SRCS += $(TOPDIR)/../dlls/client.cpp 
SRCS += $(TOPDIR)/../dlls/combat.cpp 
SRCS += $(TOPDIR)/../dlls/disc_arena.cpp 
SRCS += $(TOPDIR)/../dlls/disc_powerups.cpp 
SRCS += $(TOPDIR)/../dlls/doors.cpp 
SRCS += $(TOPDIR)/../dlls/effects.cpp 
SRCS += $(TOPDIR)/../dlls/explode.cpp 
SRCS += $(TOPDIR)/../dlls/func_break.cpp 
SRCS += $(TOPDIR)/../dlls/func_tank.cpp 
SRCS += $(TOPDIR)/../dlls/game.cpp 
SRCS += $(TOPDIR)/../dlls/gamerules.cpp 
SRCS += $(TOPDIR)/../dlls/ggrenade.cpp
SRCS += $(TOPDIR)/../dlls/globals.cpp 
SRCS += $(TOPDIR)/../dlls/h_ai.cpp 
SRCS += $(TOPDIR)/../dlls/h_battery.cpp 
SRCS += $(TOPDIR)/../dlls/h_cycler.cpp 
SRCS += $(TOPDIR)/../dlls/h_export.cpp 
SRCS += $(TOPDIR)/../dlls/healthkit.cpp 
SRCS += $(TOPDIR)/../dlls/items.cpp 
SRCS += $(TOPDIR)/../dlls/lights.cpp 
SRCS += $(TOPDIR)/../dlls/maprules.cpp 
SRCS += $(TOPDIR)/../dlls/mortar.cpp 
SRCS += $(TOPDIR)/../dlls/mpstubb.cpp 
SRCS += $(TOPDIR)/../dlls/multiplay_gamerules.cpp 
SRCS += $(TOPDIR)/../dlls/observer.cpp 
SRCS += $(TOPDIR)/../dlls/pathcorner.cpp 
SRCS += $(TOPDIR)/../dlls/plane.cpp 
SRCS += $(TOPDIR)/../dlls/plats.cpp 
SRCS += $(TOPDIR)/../dlls/player.cpp 
SRCS += $(TOPDIR)/../dlls/singleplay_gamerules.cpp 
SRCS += $(TOPDIR)/../dlls/skill.cpp 
SRCS += $(TOPDIR)/../dlls/sound.cpp 
SRCS += $(TOPDIR)/../dlls/soundent.cpp 
SRCS += $(TOPDIR)/../dlls/spectator.cpp 
SRCS += $(TOPDIR)/../dlls/subs.cpp 
SRCS += $(TOPDIR)/../dlls/teamplay_gamerules.cpp 
SRCS += $(TOPDIR)/../dlls/triggers.cpp 
SRCS += $(TOPDIR)/../dlls/util.cpp 
SRCS += $(TOPDIR)/../dlls/weapons.cpp 
SRCS += $(TOPDIR)/../dlls/world.cpp 
SRCS += $(TOPDIR)/../dlls/xen.cpp 
SRCS += $(TOPDIR)/../dlls/wpn_shared/disc_weapon_disc.cpp
SRCS_C += ../../pm_shared/pm_shared.c
SRCS_C += ../../pm_shared/pm_math.c
SRCS_C += ../../pm_shared/pm_debug.c

#INCLUDES =  -I../common -I. -I../game_shared -I../pm_shared -I../engine -I../dlls
INCLUDES =  -I$(TOPDIR)/../../common -I. -I$(TOPDIR)/../../game_shared -I$(TOPDIR)/../pm_shared -I$(TOPDIR)/../../engine -I$(TOPDIR)/../dlls -I$(TOPDIR)/../dlls/hl -I$(TOPDIR)/../../public -Igearbox

#DEFINES = -Wno-write-strings -DLINUX -D_LINUX -D_vsnprintf=vsnprintf -Dstricmp=strcasecmp -D_strnicmp=strncasecmp -Dstrnicmp=strncasecmp -DCLIENT_WEAPONS -DCLIENT_DLL -fpermissive -w -DHL_DLL -DGEARBOX_CLIENT_DLL -DGEARBOX_DLL -D_alloca=alloca -D_snprintf=snprintf -DDISABLE_VEC_ORIGIN -DDISABLE_JUMP_ORIGIN
DEFINES = -Wno-write-strings -DLINUX -D_LINUX -D_vsnprintf=vsnprintf -Dstricmp=strcasecmp -D_strnicmp=strncasecmp -Dstrnicmp=strncasecmp -DCLIENT_WEAPONS -fpermissive -w -DHL_DLL -DGEARBOX_DLL -D_alloca=alloca -D_snprintf=snprintf

LOCAL_C_INCLUDES := \
		 $(LOCAL_PATH)/../../common \
		 $(LOCAL_PATH)/../../engine \
		 $(LOCAL_PATH)/../../game_shared \
		 $(LOCAL_PATH)/../dlls \
		 $(LOCAL_PATH)/../dlls/hl \
		 $(LOCAL_PATH)/../pm_shared \
		 $(LOCAL_PATH)/../../public \
		 $(LOCAL_PATH)/gearbox $(LOCAL_PATH)/
LOCAL_CFLAGS += $(DEFINES) $(INCLUDES)

LOCAL_SRC_FILES := $(SRCS) $(SRCS_C)

include $(BUILD_SHARED_LIBRARY)
