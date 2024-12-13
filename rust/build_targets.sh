#!/bin/bash
##########################################
# Uncomment the lines below to your need:#
##########################################

INSTALLED_ARCHES="$(rustup target list | grep installed)"
NATIVE_ARCHITECTURE="$(dpkg --print-architecture)"
################################################################################################################################################
if [[ "${INSTALLED_ARCHES}" == *x86_64-unknown-linux-gnu* && ("${NATIVE_ARCHITECTURE}" == "i386" || "${NATIVE_ARCHITECTURE}" == "amd64") ]]; then
    echo test for native x86 linux #irrelevant, simply testing for scripting, lines 8 through 19 are filler and can be removed
    #cargo build
    #cargo build --release
fi
if [[ "${INSTALLED_ARCHES}" == *aarch64-unknown-linux-gnu* && "${NATIVE_ARCHITECTURE}" == "aarch64" ]]; then
    echo test for native arm64 linux
    #cargo build
    #cargo build --release
fi
################################################################################################################################################

# Native targets
#cargo build
#cargo build --release

# Windows targets (arm64 and x86)
if [[ "${INSTALLED_ARCHES}" == *x86_64-pc-windows-gnu* ]]; then
    echo test for x86 windows gnu
    #cargo build --target x86_64-pc-windows-gnu
    #cargo build --release --target x86_64-pc-windows-gnu
fi
if [[ "${INSTALLED_ARCHES}" == *aarch64-pc-windows-gnullvm* ]]; then
    echo test for arm64 windows gnu
    #cargo build --target aarch64-pc-windows-gnullvm
    #cargo build --release --target aarch64-pc-windows-gnullvm
fi
if [[ "${INSTALLED_ARCHES}" == *x86_64-pc-windows-msvc* ]]; then
    echo test for x86 windows msvc
    #cargo build --target x86_64-pc-windows-msvc
    #cargo build --release --target x86_64-pc-windows-msvc
fi
if [[ "${INSTALLED_ARCHES}" == *aarch64-pc-windows-msvc* ]]; then
    echo test for arm64 windows msvc
    #cargo build --target aarch64-pc-windows-msvc
    #cargo build --release --target aarch64-pc-windows-msvc
fi

# Mac targets (arm64 and x86)
if [[ "${INSTALLED_ARCHES}" == *x86_64-apple-darwin* ]]; then
    echo test for x86 apple
    #cargo build --target x86_64-apple-darwin
    #cargo build --release --target x86_64-apple-darwin
fi
if [[ "${INSTALLED_ARCHES}" == *aarch64-apple-darwin* ]]; then
    echo test for arm64 apple
    #cargo build --target aarch64-apple-darwin
    #cargo build --release --target aarch64-apple-darwin
fi

# Linux targets (arm64 and x86)
if [[ "${INSTALLED_ARCHES}" == *x86_64-unknown-linux-gnu* && "${NATIVE_ARCHITECTURE}" != "i386" && "${NATIVE_ARCHITECTURE}" != "amd64" ]]; then
    echo test for non native x86 linux
    #cargo build --target x86_64-unknown-linux-gnu
    #cargo build --release --target x86_64-unknown-linux-gnu
fi
if [[ "${INSTALLED_ARCHES}" == *aarch64-unknown-linux-gnu* && "${NATIVE_ARCHITECTURE}" != "aarch64" ]]; then
    echo test for non native arm64 linux
    #cargo build --target aarch64-unknown-linux-gnu
    #cargo build --release --target aarch64-unknown-linux-gnu
fi

# Web targets

# Android targets

########################################################
