#!/system/bin/sh
# Late service - Game booster daemon

MODDIR=${0%/*}

sleep 60

# Function to set game mode
set_game_mode() {
  # CPU Boost
  echo 1 > /sys/devices/system/cpu/cpufreq/boost 2>/dev/null
  
  # GPU Boost
  if [ -f /sys/class/kgsl/kgsl-3d0/max_gpuclk ]; then
    MAX_GPU=$(cat /sys/class/kgsl/kgsl-3d0/max_gpuclk)
    echo $MAX_GPU > /sys/class/kgsl/kgsl-3d0/gpuclk 2>/dev/null
  fi
  
  # Mali GPU specific
  if [ -f /sys/class/misc/mali0/device/dvfs_governor ]; then
    echo "always_on" > /sys/class/misc/mali0/device/dvfs_governor 2>/dev/null
  fi
  
  # Memory compaction
  echo 1 > /proc/sys/vm/compact_memory
  
  # CPU affinity for foreground apps
  echo "0-7" > /dev/cpuset/foreground/cpus 2>/dev/null
  echo "0-7" > /dev/cpuset/top-app/cpus 2>/dev/null
  
  # Disable sched autogroup for better gaming
  echo 0 > /proc/sys/kernel/sched_autogroup_enabled 2>/dev/null
  
  # Network QoS
  echo "background 1" > /dev/cpuctl/bg_non_interactive/tasks 2>/dev/null
  
  # Priority to display rendering
  setprop debug.egl.hw 1
  setprop debug.sf.hw 1
  setprop persist.sys.composition.type gpu
  setprop debug.composition.type gpu
  setprop debug.performance.tuning 1
  setprop video.accelerate.hw 1
  
  # Game mode properties
  setprop sys.games_spk_vol 3
  setprop debug.gr.swapinterval 0
  setprop debug.gr.numframebuffers 3
  
  # Touch responsiveness
  setprop touch.pressure.scale 0.001
  setprop touch.size.calibration geometric
  setprop touch.size.scale 100
}

# Monitor for games and apply tweaks
while true; do
  # Deteksi game processes
  GAMES=$(dumpsys activity processes | grep -E "com.mobile.legends|com.pubg.krmobile|com.garena.game.codm|com.tencent.ig|com.miHoYo.GenshinImpact|com.riotgames.league.wildrift" 2>/dev/null)
  
  if [ ! -z "$GAMES" ]; then
    set_game_mode
    
    # Set high priority
    for pid in $(pidof surfaceflinger); do
      echo -19 > /proc/$pid/oom_score_adj 2>/dev/null
      renice -20 $pid 2>/dev/null
    done
    
    # Kill unnecessary services during gaming
    am force-stop com.google.android.gms.persistent 2>/dev/null
    am force-stop com.xiaomi.market 2>/dev/null
    
    sleep 10
  else
    sleep 5
  fi
done