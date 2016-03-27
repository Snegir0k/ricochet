TARGET_ARCH_ABI = armeabi-v7a-hard
CFLAGS_OPT :=  -Og -ggdb -funsafe-math-optimizations -ftree-vectorize -fgraphite-identity -floop-interchange -funsafe-loop-optimizations -finline-limit=1024
CFLAGS_OPT_ARM := -mthumb -mfpu=neon -mcpu=cortex-a9 -pipe -mvectorize-with-neon-quad -DVECTORIZE_SINCOS -fPIC
CFLAGS_OPT_ARMv5 :=-march=armv6 -mfpu=vfp -marm -pipe
CFLAGS_OPT_X86 := -mtune=atom -march=atom -mssse3 -mfpmath=sse -funroll-loops -pipe -DVECTORIZE_SINCOS
CFLAGS_HARDFP := -D_NDK_MATH_NO_SOFTFP=1 -mhard-float -mfloat-abi=hard -DLOAD_HARDFP -DSOFTFP_LINK

LOCAL_CFLAGS += $(CFLAGS_OPT)
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a-hard)
LOCAL_CFLAGS += $(CFLAGS_OPT_ARM) $(CFLAGS_HARDFP)
endif
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += $(CFLAGS_OPT_ARM) -mfloat-abi=softfp
endif
ifeq ($(TARGET_ARCH_ABI),armeabi)
LOCAL_CFLAGS += $(CFLAGS_OPT_ARMv5)
endif
ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS += $(CFLAGS_OPT_X86)
endif
