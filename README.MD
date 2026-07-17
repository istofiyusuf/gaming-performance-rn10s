<div align="center">
<h1>🎮 GAMING PERFORMANCE MODULE v3.0</h1>
<h3>Redmi Note 10S | Helio G95 | Mali-G76 MC4</h3>
<img src="https://img.shields.io/badge/Version-v3.0-red?style=for-the-badge&logo=github">
<img src="https://img.shields.io/badge/Device-Redmi%20Note%2010S-orange?style=for-the-badge&logo=xiaomi">
<img src="https://img.shields.io/badge/Magisk-Supported-brightgreen?style=for-the-badge&logo=android">
<img src="https://img.shields.io/badge/KernelSU-Supported-blue?style=for-the-badge&logo=android">
</div>

---

## 📖 OVERVIEW

Module Magisk/KernelSU premium untuk memaksimalkan performa gaming di Redmi Note 10S. Dirancang khusus untuk chipset MediaTek Helio G95 dengan GPU Mali-G76 MC4 agar pengalaman gaming lebih lancar, stabil, dan responsif.

---

## ✨ FITUR UTAMA

🚀 PERFORMANCE OPTIMIZATION
- ⚡ CPU Governor → Performance (All Cores)
- 🎯 GPU Clock → 900MHz Unlock
- 💾 ZRAM → LZ4 Compression
- 📊 I/O Scheduler → Kyber (Low Latency)
- 🌐 TCP → Westwood (Stable Ping)

🛠️ SMART FEATURES
- 🤖 Auto Game Detection & Boost
- 🧠 Process Priority Manager
- 🧹 One-Click RAM Cleaner
- 📈 Real-Time FPS Monitor
- 🎛️ Terminal Game Booster
- 🔥 Thermal Optimizer

---

## 🎮 SUPPORTED GAMES

| Game | Auto Detect | Optimization |
|------|:----------:|:------------:|
| Mobile Legends: Bang Bang | ✅ | Maximum |
| PUBG Mobile / BGMI | ✅ | Maximum |
| Genshin Impact | ✅ | Extreme |
| Call of Duty Mobile | ✅ | Maximum |
| League of Legends: Wild Rift | ✅ | Maximum |
| Free Fire | ✅ | High |
| Minecraft | ✅ | High |
| Roblox | ✅ | High |
| Clash of Clans | ✅ | Balanced |
| Clash Royale | ✅ | Balanced |

---

## 📥 INSTALLATION

### Via Magisk Manager
1. Download file zip dari bawah
2. Buka Magisk → Modules → Install from storage
3. Pilih file zip
4. Reboot device

### Via KernelSU Manager
1. Download file zip dari bawah
2. Buka KernelSU → Modules → Install
3. Pilih file zip
4. Reboot device

### Via Recovery (TWRP/OrangeFox)
1. Download file zip
2. Reboot ke Recovery
3. Flash zip file
4. Reboot

---

## 🕹️ CARA PENGGUNAAN

### Auto Mode (Default)
Module otomatis bekerja setelah boot dan mendeteksi game yang berjalan.

### Manual Mode
Buka terminal (Termux/ADB) dan jalankan:

su -c gaming_tweaks

Menu Options:
- Optimize running games
- Extreme performance mode
- Balanced mode
- Clear RAM & cache
- FPS monitor
- Show device info

---

## 📊 PERFORMANCE BENCHMARK

| Game | Before | After | Graphics Settings |
|------|--------|-------|-------------------|
| PUBG Mobile | 40-50 FPS | 55-60 FPS | Smooth + Extreme |
| Mobile Legends | 55-60 FPS | 60 FPS Stable | Ultra Graphics |
| Genshin Impact | 25-30 FPS | 35-45 FPS | Medium 60FPS |
| CODM | 50-55 FPS | 60 FPS | Very High + Max |
| Free Fire | 50-55 FPS | 60 FPS | Ultra |

---

## ⚠️ PERINGATAN

🔥 Thermal Warning: Suhu device bisa mencapai 45-50°C saat gaming intensif. Gunakan cooling fan eksternal untuk sesi gaming panjang. Jangan gunakan sambil charging. Monitor suhu menggunakan CPU-Z atau DevCheck.

🔋 Battery: Battery life berkurang 20-30% saat mode gaming aktif. Mode Extreme lebih boros battery. Gunakan Balanced Mode untuk gaming casual.

🛡️ Safety: Sudah di test di Redmi Note 10S MIUI 13. Tidak menyebabkan bootloop. Bisa uninstall kapan saja. Backup data penting sebelum install.

---

## 🐛 TROUBLESHOOTING

Module tidak aktif setelah reboot: ls /data/adb/modules/gaming_perf_rn10s

Game tidak terdeteksi otomatis: su -c gaming_tweaks lalu pilih option 1

Device terlalu panas: Aktifkan Balanced Mode, turunkan pengaturan grafis game, gunakan cooling fan

---

## 🗑️ UNINSTALL

Via Manager: Magisk/KernelSU → Modules → Remove → Reboot

Via Terminal: rm -rf /data/adb/modules/gaming_perf_rn10s && reboot

---

## 📝 CHANGELOG

v3.0: Complete rewrite Helio G95, Auto game detection, Terminal UI, ZRAM LZ4, Kyber I/O scheduler

v2.0: GPU boost, Memory management

v1.0: Initial release

---

## 🙏 CREDITS

topjohnwu (Magisk) | KernelSU Team | Redmi Note 10S Community

---

## ⭐ SUPPORT

Jika module ini membantu, berikan star di repository ini!

---

Disclaimer: Module ini tidak berafiliasi dengan Xiaomi atau MediaTek. Gunakan dengan resiko sendiri.

---

Download file zip dibawah ini 👇

https://github.com/istofiyusuf/gaming-performance-rn10s/releases/tag/v3.0
