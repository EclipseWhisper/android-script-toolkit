#!/system/bin/sh

# 用法：
# 冻结：sh app_freeze.sh freeze 包名
# 解冻：sh app_freeze.sh unfreeze 包名

ACTION="$1"
PKG="$2"

if [ -z "$ACTION" ] || [ -z "$PKG" ]; then
    echo "用法: sh app_freeze.sh [freeze|unfreeze] 包名"
    exit 1
fi

case "$ACTION" in
    freeze)
        pm disable-user --user 0 "$PKG"
        echo "已冻结: $PKG"
        ;;
    unfreeze)
        pm enable "$PKG"
        echo "已解冻: $PKG"
        ;;
    *)
        echo "未知操作: $ACTION"
        ;;
esac
