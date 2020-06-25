#!/system/bin/sh

#XTRV tweaks Uninstaller Script
# Copyright (c) 2018-2020 BanditGR @ Xiaomi-Miui Hellas
# Licence: MIT

# Uninstalls the module ZZWipeswap file (in Magisk service.d folder) if it exists
# Under normal circumstances the file should not exist, it's just a legacy leftover

MODPATH=${0%/*}

# Load functions
#. $MODPATH/util_functions.sh

 rm -f /data/adb/service.d/ZZWipeswap
 
 #We are done here !