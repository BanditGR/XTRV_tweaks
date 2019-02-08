#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

sh $MODDIR/09sdcardspeedfix
sh $MODDIR/S97MemoryTweaks
sh $MODDIR/S97SystemOptimizer
sh $MODDIR/sysctl_tweaks
sh $MODDIR/Zsqlite_optimize
sh $MODDIR/ZZEnableDocuments
sh $MODDIR/ZZLMK