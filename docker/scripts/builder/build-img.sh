#!/bin/bash

make distclean
make m8b_onecloud_config
make -j$(nproc)
