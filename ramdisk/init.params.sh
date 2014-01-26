#!/system/bin/sh

# Restart rild
setprop rild.libpath "/system/lib/libril-qc-qmi-1.so"
stop ril-daemon
start ril-daemon

# Set kernel tweaks
echo 0,1,2,4,9,15 > /sys/module/lowmemorykiller/parameters/adj
echo 2048,3072,6144,15360,17920,20480 > /sys/module/lowmemorykiller/parameters/minfree
echo "1" > /proc/sys/vm/page-cluster
echo "32768" > /proc/sys/kernel/msgmni
echo "65536" > /proc/sys/kernel/msgmax
echo "10" > /proc/sys/vm/swappiness
echo "80" > /proc/sys/vm/vfs_cache_pressure
echo "50" > /proc/sys/vm/dirty_background_ratio
echo "10" > /proc/sys/fs/lease-break-time
echo "500,512000,64,2048" > /proc/sys/kernel/sem
echo "500" > /proc/sys/vm/dirty_expire_centisecs
echo "1000" > /proc/sys/vm/dirty_writeback_centisecs
echo "0" > /proc/sys/net/ipv4/tcp_timestamps;
echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle;
