#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

#With MIUI Pie we have to wait a bit before executing the scripts
sleep 30

sh $MODDIR/scripts/09sdcardspeedfix
sh $MODDIR/scripts/S97MemoryTweaks
sh $MODDIR/scripts/S97SystemOptimizer
sh $MODDIR/scripts/sysctl_tweaks
sh $MODDIR/scripts/Zsqlite_optimize
sh $MODDIR/scripts/ZZEnableDocuments
sh $MODDIR/scripts/ZZLMK