MICRONDK_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR ?= $(shell pwd)
CLEAR_VARS := $(MICRONDK_DIR)/clear_vars.mk
XASH3D_CONFIG := $(MICRONDK_DIR)/xash3d_config.mk
BUILD_SHARED_LIBRARY := $(MICRONDK_DIR)/build-shared.mk
NANOGL_PATH=../nanogl
SDL_PATH=../SDL2
XASH_SDL=1
my-dir := $(shell pwd)
include $(PROJECT_DIR)/Android.mk