if [ -d /data/adb/modules/tricky_store ]; then
    TARGET_DIR="/data/adb/tricky_store"
    TARGET_FILE="$TARGET_DIR/target.txt"

    mkdir -p "$TARGET_DIR"

    {
        echo "com.google.android.gms"
        echo "com.android.vending"
        echo "com.coloros.sceneservice"
        pm list packages -3 | cut -d ":" -f 2 | sed '/^$/d'
    } | awk '!seen[$0]++' > "$TARGET_FILE"

    echo "target.txt 生成完成"
else
    echo "未安装 Tricky Store 模块"
fi
