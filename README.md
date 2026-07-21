# SpaceIsLinux

System architecture repository for the custom Linux distribution (Space.Detected OS).

## Overview

This repository contains the root filesystem tree (`custom-root`), user space configurations, system initialization scripts, and custom binaries utilized during the assembly and configuration of the SpaceIsLinux OS build environment.

## Directory Structure

* `custom-root/` — Base target filesystem tree (excluding dynamic virtual paths and swap allocations).
  * `custom-root/etc/` — System-wide configurations, daemon definitions, and startup scripts.
  * `custom-root/usr/local/bin/` — Custom system utilities and management scripts (`sil-*`).
  * `custom-root/home/` — User profile skeletons and default user space configs.
* `src/` — Source code for custom binaries and system utilities (`sil-fetch.c`, system routines).
* `bin/` — Precompiled binaries and local helper executables.

## Build Requirements

To assemble or modify the root image:
* Linux environment (Mint / Ubuntu base)
* System tools: `gcc`, `git`, `squashfs-tools`, `cubic`
* Root elevated permissions (`sudo`) for mounting virtual filesystems (`dev`, `proc`, `sys`) during `chroot` operations.

## Maintainer Info

* Maintainer: kid-blip
* Main Branch: `main`


Download: https://drive.google.com/file/d/1oI9f2GxhnEJkhujTzbFodw7qIyNu4wnP/view?usp=sharing
