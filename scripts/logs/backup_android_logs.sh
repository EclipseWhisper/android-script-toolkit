#!/system/bin/sh

LOG_BASE_DIR="/storage/emulated/0/AndroidScriptToolkit"
PSTORE_BACKUP_DIR="$LOG_BASE_DIR/pstore"
DMESG_BACKUP_DIR="$LOG_BASE_DIR/dmesg"
LOGCAT_BACKUP_DIR="$LOG_BASE_DIR/logcat"

mkdir -p "$PSTORE_BACKUP_DIR"
mkdir -p "$DMESG_BACKUP_DIR"
mkdir -p "$LOGCAT_BACKUP_DIR"

TS=$(date +%Y%m%d_%H%M%S)

echo "开始备份日志..."

if [ -d /sys/fs/pstore ] && [ -n "$(ls -A /sys/fs/pstore 2>/dev/null)" ]; then
    mkdir -p "$PSTORE_BACKUP_DIR/$TS"
    cp -r /sys/fs/pstore/* "$PSTORE_BACKUP_DIR/$TS/" 2>/dev/null
    echo "pstore 已备份到: $PSTORE_BACKUP_DIR/$TS"
else
    echo "未发现可备份的 pstore 内容"
fi

dmesg > "$DMESG_BACKUP_DIR/dmesg_$TS.txt" 2>/dev/null && \
echo "dmesg 已导出: $DMESG_BACKUP_DIR/dmesg_$TS.txt"

logcat -d > "$LOGCAT_BACKUP_DIR/logcat_$TS.txt" 2>/dev/null && \
echo "logcat 已导出: $LOGCAT_BACKUP_DIR/logcat_$TS.txt"

echo "日志备份完成。"
