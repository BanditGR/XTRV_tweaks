##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "************************************************"
  ui_print " Redmi Note 5 XTRV tweaks [Whyred]         "
  ui_print " by BanditGR @ Xiaomi-Miui Hellas  "
  ui_print "                       v1.4                             "
  ui_print "************************************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
  
  # Set permissions for binaries
  set_perm  $MODPATH/system/xbin/sqlite3 0  0  0755  0755
  set_perm  $MODPATH/system/xbin/zipalign 0  0  0755  0755
  
  # Set permissions for script execution - Experimental
  set_perm  $MODPATH/scripts/09sdcardspeedfix 0  0  0755  0755
  set_perm  $MODPATH/scripts/S97MemoryTweaks 0  0  0755  0755
  set_perm  $MODPATH/scripts/S97SystemOptimizer 0  0  0755  0755
  set_perm  $MODPATH/scripts/sysctl_tweaks 0  0  0755  0755
  set_perm  $MODPATH/scripts/Zsqlite_optimize 0  0  0755  0755
  set_perm  $MODPATH/scripts/ZZEnableDocuments 0  0  0755  0755
  set_perm  $MODPATH/scripts/ZZLMK 0  0  0755  0755
  set_perm  /data/adb/service.d/ZZWipeswap 0  0  0755  0755
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

# Install the init.d scripts in the common folder, this is essential, Magisk will not do this for you!
script_install() {
    ui_print ""
    ui_print "Now installing sh scripts in the module common folder..."
    mkdir -m 755 -p $MODPATH/scripts
	cp -af $INSTALLER/common/scripts/09sdcardspeedfix $MODPATH/scripts/09sdcardspeedfix
	cp -af $INSTALLER/common/scripts/S97MemoryTweaks $MODPATH/scripts/S97MemoryTweaks
	cp -af $INSTALLER/common/scripts/S97SystemOptimizer $MODPATH/scripts/S97SystemOptimizer
	cp -af $INSTALLER/common/scripts/sysctl_tweaks $MODPATH/scripts/sysctl_tweaks
	cp -af $INSTALLER/common/scripts/Zsqlite_optimize $MODPATH/scripts/Zsqlite_optimize
	cp -af $INSTALLER/common/scripts/ZZEnableDocuments $MODPATH/scripts/ZZEnableDocuments
	cp -af $INSTALLER/common/scripts/ZZLMK $MODPATH/scripts/ZZLMK
	cp -af $INSTALLER/common/scripts/ZZWipeswap /data/adb/service.d/ZZWipeswap
	ui_print ""
	ui_print "- It is HIGHLY recommended to have Busybox installed."
	ui_print "- osm0sis' Busybox can be downloaded and installed from the Magisk repository."
	ui_print ""
}
