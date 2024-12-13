#!/bin/bash
#############################################################################
# Uncomment the components (delete # in front) and lines below to your need:#
#############################################################################

# Install rustup
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Windows targets (arm64 and x86, pick one (gnu or msvc, not both) each,
# in case of using gnu and ubuntu, afterwards run what the script tells you
# (DO NOT PUT SUDO INSTRUCTIONS IN SCRIPT))
#rustup target add x86_64-pc-windows-gnu
#rustup target add aarch64-pc-windows-gnullvm
#rustup target add x86_64-pc-windows-msvc
#rustup target add aarch64-pc-windows-msvc

# Mac targets (arm64 and x86)
#rustup target add aarch64-apple-darwin
#rustup target add x86_64-apple-darwin

# Linux targets (arm64 and x86)
#rustup target add aarch64-unknown-linux-gnu
#rustup target add x86_64-unknown-linux-gnu

# Web targets

# Android targets

INSTALLED_ARCHES="$(rustup target list | grep installed)"
OPERATING_SYSTEM="$(cat /etc/os-release | grep "^NAME")"
if [[ "${OPERATING_SYSTEM}" == NAME=\"*buntu\" && "${INSTALLED_ARCHES}" == *pc-windows-gnu* ]]; then
    CHECK_DEPENDENCY="$(apt list --installed | grep ^mingw-w64/)"
    if [[ "${CHECK_DEPENDENCY}" != *mingw* ]]; then
        echo Please run sudo apt install mingw-w64 before running the next script.
    else
        echo Good to go.
    fi
fi
# Please add different operating system procedures here.

#########################################################
