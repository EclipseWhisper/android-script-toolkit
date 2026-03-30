#!/system/bin/sh

echo "=============================="
echo " Android Root Environment Check"
echo "=============================="

echo
echo "[1] whoami:"
whoami 2>/dev/null || echo "fail"

echo
echo "[2] id:"
id 2>/dev/null || echo "fail"

echo
echo "[3] su path:"
command -v su 2>/dev/null || echo "not found"

echo
echo "[4] SELinux:"
getenforce 2>/dev/null || echo "unknown"

echo
echo "[5] Android version:"
getprop ro.build.version.release
echo "API: $(getprop ro.build.version.sdk)"

echo
echo "[6] SoC:"
getprop ro.soc.model
getprop ro.board.platform

echo
echo "Done."
