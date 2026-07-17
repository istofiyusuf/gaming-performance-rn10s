# 🎮 Gaming Performance Module for Redmi Note 10S

[![Magisk](https://img.shields.io/badge/Magisk-Module-brightgreen)](https://github.com/topjohnwu/Magisk)
[![KernelSU](https://img.shields.io/badge/KernelSU-Support-blue)](https://kernelsu.org/)
[![Version](https://img.shields.io/badge/Version-v3.0-red)]()
[![Device](https://img.shields.io/badge/Device-Redmi%20Note%2010S-orange)]()
[![Platform](https://img.shields.io/badge/Platform-MediaTek%20Helio%20G95-yellowgreen)]()

Optimasi performa gaming maksimal untuk Redmi Note 10S (rosemary/secret) dengan chipset MediaTek Helio G95 dan GPU Mali-G76 MC4.

## 📱 Device Support

| Device | Codename | Chipset | GPU | Status |
|--------|----------|---------|-----|--------|
| Redmi Note 10S | rosemary/secret | Helio G95 (MT6785) | Mali-G76 MC4 | ✅ Supported |

## ✨ Fitur Utama

### 🚀 Performa CPU
- **CPU Governor**: Di set ke `performance` untuk semua cluster (big.LITTLE)
- **CPU Max Frequency**: Unlock full speed Cortex-A76 (2.05GHz) & Cortex-A55 (2.0GHz)
- **CPU Hotplug**: Disable core control untuk menjaga semua core aktif
- **CPU Affinity**: Optimasi untuk foreground dan top-app processes

### 🎯 Performa GPU
- **GPU Governor**: Set ke `always_on` untuk Mali-G76
- **GPU Max Clock**: Unlock 900MHz GPU frequency
- **GPU Rendering**: Hardware acceleration optimization
- **OpenGL/Vulkan**: Enhanced rendering performance

### 💾 Memory & RAM Management
- **ZRAM Optimization**: Menggunakan LZ4 compression
- **Swappiness**: Di tuning untuk gaming performance
- **Cache Pressure**: Optimasi VFS cache
- **Memory Compaction**: Auto defrag saat gaming
- **Drop Caches**: Clear RAM manual via script

### 📊 I/O & Storage
- **I/O Scheduler**: Menggunakan `kyber` (low latency)
- **Read Ahead**: 256KB untuk sequential read
- **I/O Stats**: Disable untuk mengurangi overhead
- **Entropy Pool**: Diperbesar untuk random I/O performance

### 🌐 Network Latency
- **TCP Congestion**: `westwood` untuk lower latency
- **TCP Low Latency**: Enable untuk real-time gaming
- **TCP Timestamps**: Disable untuk mengurangi overhead
- **Network QoS**: Prioritaskan game traffic

### 🎛️ Thermal Management
- **Thermal Throttling**: Temporary disable saat sesi gaming
- **Thermal Limit**: Custom threshold untuk performa maksimal
- **Warning**: Monitor suhu device secara manual

### 🎮 Game-Specific Optimizations
Auto-detection untuk game populer:
- Mobile Legends: Bang Bang
- PUBG Mobile / BGMI
- Call of Duty Mobile
- Genshin Impact
- League of Legends: Wild Rift
- Free Fire
- Minecraft
- Roblox
- Clash of Clans
- Clash Royale
- Dan game lainnya

### 🛠️ Tools & Utilities
- **gaming_tweaks**: Terminal-based game booster
- **Auto Game Detection**: Otomatis deteksi dan optimasi saat game berjalan
- **FPS Monitor**: Real-time FPS counter
- **RAM Cleaner**: One-click RAM optimization
- **Priority Manager**: Set process priority ke maksimum

## 📋 Prasyarat

- Redmi Note 10S dengan root (Magisk/KernelSU)
- MIUI 12/13/14 atau Custom ROM
- Minimal 1GB free storage

## 📥 Cara Install

### Via Magisk Manager
1. Download file zip dari [Releases](https://github.com/yourusername/gaming-performance-rn10s/releases)
2. Buka Magisk Manager
3. Pilih Modules → Install from storage
4. Pilih file zip
5. Reboot

### Via KernelSU
1. Download file zip
2. Buka KernelSU Manager
3. Modules → Install
4. Pilih file zip
5. Reboot

### Via Recovery (TWRP/OrangeFox)
1. Download file zip
2. Reboot ke recovery
3. Flash zip file
4. Reboot

## 🎮 Cara Penggunaan

### Auto Mode (Default)
Module akan otomatis bekerja setelah boot. Deteksi game berjalan otomatis.

### Manual Mode via Terminal
```bash
# Buka terminal (Termux/ADB Shell)
su -c gaming_tweaks

Menu Options:
Optimize running games - Optimasi semua game yang sedang berjalan

Extreme performance mode - Mode performa maksimal (lebih panas)

Balanced mode - Mode seimbang performa & suhu

Clear RAM & cache - Bersihkan RAM

FPS monitor - Monitor FPS real-time

Show device info - Tampilkan info device

📊 Performance Benchmark
Game	Before	After	Settings
PUBG Mobile	40-50 FPS	55-60 FPS	Smooth+Extreme
MLBB	55-60 FPS	60 FPS stable	Ultra Graphics
Genshin Impact	25-30 FPS	35-45 FPS	Medium 60FPS
CODM	50-55 FPS	60 FPS	Very High+Max
⚙️ Konfigurasi Custom
Edit parameter via file:
bash
# CPU Governor
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# GPU Clock
echo 900000 > /proc/gpufreq/gpufreq_opp_max_freq

# I/O Scheduler
echo "kyber" > /sys/block/mmcblk0/queue/scheduler
Whitelist/Blacklist Game:
Edit file service.sh dan tambahkan/hapus package name game.

⚠️ Peringatan
🔥 Thermal Warning
Module dapat meningkatkan suhu device hingga 45-50°C saat gaming intensif

Gunakan cooling fan eksternal untuk sesi gaming panjang

Jangan gunakan sambil charging untuk mencegah overheat

Monitor suhu menggunakan aplikasi seperti CPU-Z atau DevCheck

🔋 Battery
Battery life akan berkurang 20-30% saat gaming

Performa mode extreme akan mengkonsumsi battery lebih cepat

Gunakan balanced mode untuk gaming casual

🛡️ Safety
Module sudah di test di Redmi Note 10S MIUI 13

Selalu backup sebelum install

Module tidak menyebabkan bootloop jika diinstall dengan benar

Uninstall via Magisk/KernelSU Manager jika terjadi masalah

🐛 Troubleshooting
Module tidak aktif setelah reboot
bash
# Check apakah module terinstall
ls /data/adb/modules/gaming_perf_rn10s

# Check log
cat /data/adb/modules/gaming_perf_rn10s/module.log
Game tidak terdeteksi
bash
# Manual optimasi
su -c gaming_tweaks
# Pilih option 1
Device terlalu panas
Gunakan balanced mode

Turunkan grafis game

Gunakan cooling fan

🗑️ Uninstall
Buka Magisk/KernelSU Manager

Modules → Hapus Gaming Performance RN10S

Reboot

Atau via recovery:

bash
# Flash module uninstaller atau
rm -rf /data/adb/modules/gaming_perf_rn10s
reboot
📝 Changelog
v3.0 (Current)
Complete rewrite untuk Helio G95

Auto game detection

Terminal UI untuk kontrol manual

Network latency optimization

ZRAM LZ4 compression

Kyber I/O scheduler

v2.0
GPU performance boost

Memory management improvements

v1.0
Initial release

Basic CPU/GPU tweaks

🤝 Contributing
Contributions, issues, dan feature requests sangat diterima!
Silakan buat pull request atau open issue.

📜 License
MIT License - Lihat file LICENSE untuk detail.

👤 Author
RizkyDev

GitHub: @yourusername

Telegram: @yourtelegram

🙏 Credits
topjohnwu - Magisk

KernelSU Team

Redmi Note 10S Community

MediaTek Helio G95 Community

⭐ Support
Jika module ini membantu, berikan ⭐ di repository ini!

Disclaimer: Module ini tidak berafiliasi dengan Xiaomi atau MediaTek. Gunakan dengan resiko sendiri. Author tidak bertanggung jawab atas kerusakan device.