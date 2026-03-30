#!/system/bin/sh

LITTLE_MAX=1800000
MID_MAX=2400000
PRIME_MAX=2800000

CPU0_PATH="/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"
CPU4_PATH="/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq"
CPU7_PATH="/sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq"

echo "正在设置 CPU 上限..."

set_freq() {
    local path="$1"
    local value="$2"
    local name="$3"

    if [ -f "$path" ]; then
        echo "$value" > "$path"
        echo "$name 已设置为: $(cat "$path" 2>/dev/null)"
    else
        echo "$name 对应节点不存在: $path"
    fi
}

set_freq "$CPU0_PATH" "$LITTLE_MAX" "小核簇"
set_freq "$CPU4_PATH" "$MID_MAX" "中核簇"
set_freq "$CPU7_PATH" "$PRIME_MAX" "超大核"

echo "设置完成。"
