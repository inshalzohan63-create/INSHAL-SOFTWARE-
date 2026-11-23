#!/data/data/com.termux/files/usr/bin/bash

# --- Colors & Formatting ---
BOLD="\e[1m"
CYAN="\e[1;36m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
WHITE="\e[1;37m"
RESET="\e[0m"

# --- Editable Banner (Change these anytime on GitHub!) ---
STATUS="Online & Ready"
MESSAGE="Welcome back to INSHAL's SOFTWARE!"

# --- Clear & Print Header ---
clear
echo -e "${CYAN}==============================================${RESET}"
echo -e "${GREEN}           INSHAL's SOFTWARE!                 ${RESET}"
echo -e "${CYAN}==============================================${RESET}"
echo -e "${YELLOW}Status  :${RESET} ${WHITE}${STATUS}${RESET}"
echo -e "${YELLOW}Message :${RESET} ${WHITE}${MESSAGE}${RESET}"
echo -e "${CYAN}==============================================${RESET}"
echo ""

# --- System & Network Functions ---
get_device_info() {
    BRAND=$(getprop ro.product.brand)
    MODEL=$(getprop ro.product.model)
    ANDROID_VER=$(getprop ro.build.version.release)

    LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7; exit}')
    [ -z "$LOCAL_IP" ] && LOCAL_IP="Not Connected"

    PUBLIC_IP=$(curl -s --max-time 3 https://ipify.org)
    [ -z "$PUBLIC_IP" ] && PUBLIC_IP="Offline"

    echo -e "${GREEN}[+]${RESET} ${BOLD}Device Name :${RESET} ${WHITE}$BRAND $MODEL (Android $ANDROID_VER)${RESET}"
    echo -e "${GREEN}[+]${RESET} ${BOLD}Local IP    :${RESET} ${WHITE}$LOCAL_IP${RESET}"
    echo -e "${GREEN}[+]${RESET} ${BOLD}Public IP   :${RESET} ${WHITE}$PUBLIC_IP${RESET}"
}

get_device_info
echo ""
echo -e "${CYAN}==============================================${RESET}"
