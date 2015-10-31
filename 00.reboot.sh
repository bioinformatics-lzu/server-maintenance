echo "assign ip address"
ifconfig enp9s0f1 192.168.1.10
sleep 2
echo "mount"
mount -a
echo "start nfs"
systemctl start nfs
echo "add firewall"
firewall-cmd --add-service nfs
