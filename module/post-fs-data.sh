#!/system/bin/sh
# Post-fs-data script - Early performance tuning

MODDIR=${0%/*}

# Wait for boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
  sleep 5
done

sleep 30

# Set high performance mode
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor

# GPU max frequency
if [ -d /proc/gpufreq ]; then
  echo "performance" > /proc/gpufreq/gpufreq_power_mode
fi

# Disable CPU hotplug (keep all cores active)
for cpu in /sys/devices/system/cpu/cpu*/core_ctl/enable; do
  echo 0 > $cpu 2>/dev/null
done

# Disable thermal throttling temporarily (gaming session)
echo 0 > /sys/class/thermal/thermal_message/cpu_limits 2>/dev/null

# I/O scheduler tuning
for queue in /sys/block/*/queue; do
  echo "kyber" > $queue/scheduler 2>/dev/null
  echo 256 > $queue/read_ahead_kb 2>/dev/null
  echo 0 > $queue/iostats 2>/dev/null
  echo 0 > $queue/add_random 2>/dev/null
done

# Entropy pool
echo 512 > /proc/sys/kernel/random/read_wakeup_threshold
echo 1024 > /proc/sys/kernel/random/write_wakeup_threshold

# TCP tweaks for lower latency
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
echo 1 > /proc/sys/net/ipv4/tcp_low_latency
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

# ZRAM optimization
echo 1 > /sys/block/zram0/max_comp_streams 2>/dev/null
echo lz4 > /sys/block/zram0/comp_algorithm 2>/dev/null

# VM tweaks
echo 100 > /proc/sys/vm/swappiness
echo 20 > /proc/sys/vm/vfs_cache_pressure
echo 300 > /proc/sys/vm/dirty_writeback_centisecs
echo 1500 > /proc/sys/vm/dirty_expire_centisecs