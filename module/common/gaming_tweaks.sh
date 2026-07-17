#!/system/bin/sh
# Manual game booster script

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Game list
GAMES="
com.mobile.legends
com.pubg.krmobile
com.garena.game.codm
com.tencent.ig
com.miHoYo.GenshinImpact
com.riotgames.league.wildrift
com.mojang.minecraftpe
com.roblox.client
com.supercell.clashofclans
com.supercell.clashroyale
"

apply_performance() {
    local MODE=$1
    echo -e "${GREEN}[*] Applying $MODE mode...${NC}"
    
    case $MODE in
        "extreme")
            # Extreme performance
            echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 2>/dev/null
            echo 2050000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq 2>/dev/null
            
            # GPU max clock
            echo 900000 > /proc/gpufreq/gpufreq_opp_max_freq 2>/dev/null
            
            # Drop all caches
            sync && echo 3 > /proc/sys/vm/drop_caches
            ;;
        "balanced")
            # Balanced mode
            echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
            echo 80 > /proc/sys/vm/swappiness
            ;;
        "battery")
            # Battery saving
            echo "powersave" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
            echo 60 > /proc/sys/vm/swappiness
            ;;
    esac
}

optimize_game() {
    local PACKAGE=$1
    echo -e "${YELLOW}[+] Optimizing $PACKAGE...${NC}"
    
    # Set game process priority
    PID=$(pidof $PACKAGE)
    if [ ! -z "$PID" ]; then
        echo -20 > /proc/$PID/oom_adj 2>/dev/null
        renice -20 $PID 2>/dev/null
        taskset -p 0-7 $PID 2>/dev/null
        echo -e "${GREEN}    PID: $PID - Priority set to maximum${NC}"
    else
        echo -e "${RED}    Game not running${NC}"
    fi
}

show_menu() {
    clear
    echo -e "${GREEN}================================="
    echo "  GAMING TWEAKS RN10S v3.0"
    echo -e "=================================${NC}"
    echo ""
    echo "1. Optimize running games"
    echo "2. Extreme performance mode"
    echo "3. Balanced mode"
    echo "4. Clear RAM & cache"
    echo "5. FPS monitor"
    echo "6. Show device info"
    echo "0. Exit"
    echo ""
    echo -n "Select option: "
}

# Main loop
while true; do
    show_menu
    read OPTION
    
    case $OPTION in
        1)
            echo -e "\n${GREEN}[*] Scanning for games...${NC}"
            for game in $GAMES; do
                if pidof $game >/dev/null 2>&1; then
                    optimize_game $game
                fi
            done
            echo -e "\nPress enter to continue..."
            read
            ;;
        2)
            apply_performance extreme
            echo -e "${GREEN}[✓] Extreme mode activated${NC}"
            sleep 2
            ;;
        3)
            apply_performance balanced
            echo -e "${GREEN}[✓] Balanced mode activated${NC}"
            sleep 2
            ;;
        4)
            echo -e "${YELLOW}[*] Clearing RAM...${NC}"
            sync && echo 3 > /proc/sys/vm/drop_caches
            echo -e "${GREEN}[✓] Done!${NC}"
            sleep 2
            ;;
        5)
            echo -e "${YELLOW}[*] FPS Monitor (Press Ctrl+C to exit)${NC}"
            while true; do
                FPS=$(dumpsys gfxinfo $(dumpsys window | grep mCurrentFocus | cut -d' ' -f5 | cut -d'}' -f1) 2>/dev/null | grep "Total frames" | tail -1)
                echo -ne "\rCurrent FPS: $FPS   "
                sleep 1
            done
            ;;
        6)
            echo -e "\n${GREEN}=== Device Info ===${NC}"
            echo "CPU Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
            echo "CPU Max Freq: $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)"
            echo "GPU Freq: $(cat /proc/gpufreq/gpufreq_opp_freq 2>/dev/null)"
            echo "RAM Total: $(free -h | grep Mem | awk '{print $2}')"
            echo "RAM Free: $(free -h | grep Mem | awk '{print $4}')"
            echo "SWAP: $(free -h | grep Swap | awk '{print $2}')"
            echo -e "\nPress enter to continue..."
            read
            ;;
        0)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            sleep 1
            ;;
    esac
done