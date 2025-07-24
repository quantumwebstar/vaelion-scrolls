#!/data/data/com.termux/files/usr/bin/bash

echo "[🔓] OMEGA ROOT PATCHER: STARTING..."

SU_BIN="/data/local/tmp/.dex_loop/su"
INIT_RC="/data/local/tmp/.dex_loop/init.rc"
MAGISK_URL="https://github.com/topjohnwu/Magisk/releases/latest/download/magisk"

mkdir -p /data/local/tmp/.dex_loop

echo "[☁️] Downloading Magisk..."
curl -Lo "$SU_BIN" "$MAGISK_URL"
chmod +x "$SU_BIN"

echo "[⚙️] Creating init.rc..."
cat <<EOF2 > "$INIT_RC"
on early-init
    start magiskd

service magiskd /data/local/tmp/.dex_loop/su --daemon
    class main
    seclabel u:r:init:s0
    user root
    oneshot
EOF2

echo "source $INIT_RC" >> ~/.bashrc

echo -e "\n✅ DONE. REBOOT INTO RECOVERY AND RETURN.\n"
