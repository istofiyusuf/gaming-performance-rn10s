#!/sbin/sh
# Gaming Performance Module for Redmi Note 10S

SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

REPLACE=""

print_modname() {
  ui_print "************************************"
  ui_print "  GAMING PERFORMANCE RN10S v3.0"
  ui_print "  Optimized for Helio G95 (Mali-G76)"
  ui_print "************************************"
}

on_install() {
  ui_print "- Extracting module files..."
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  
  # Backup build.prop
  cp /system/build.prop $MODPATH/backup_build.prop
  
  ui_print "- Installing gaming tweaks..."
  cp -f $MODPATH/common/gaming_tweaks.sh $MODPATH/system/bin/gaming_tweaks
  chmod 755 $MODPATH/system/bin/gaming_tweaks
  
  ui_print "- Setting up performance scripts..."
  
  # Deteksi GPU renderer
  ui_print "- Detecting GPU configuration..."
  if [ -f /proc/gpufreq/gpufreq_opp_dump ]; then
    ui_print "  Mali-G76 GPU detected"
  fi
  
  ui_print "- Installation complete!"
  ui_print "  Reboot untuk mengaktifkan tweak"
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
  set_perm $MODPATH/system/bin/gaming_tweaks 0 0 0755
}