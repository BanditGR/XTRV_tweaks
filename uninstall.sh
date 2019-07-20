#!/system/bin/sh

# Redmi Note 5 XTRV tweaks [Whyred] Uninstaller Script
# Copyright (c) 2018-2019 BanditGR @ Xiaomi-Miui Hellas
# Licence: MIT

# Uninstalls the module ZZWipeswap file (in Magisk service.d folder)

MODPATH=${0%/*}

# Load functions
#. $MODPATH/util_functions.sh

 rm -f /data/adb/service.d/ZZWipeswap
 
 #We are done here !