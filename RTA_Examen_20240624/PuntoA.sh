sudo fdisk /dev/sdc
sudo fdisk /dev/sdd
lsblk
sudo pvcreate /dev/sdc1
sudo pvcreate /dev/sdd1
sudo vgcreate vg_datos /dev/sdd1
sudo vgcreate vg_temp /dev/sdc1
sudo lvcreate -L +5M -n lv_docker vg_datos
sudo lvcreate -L +1.5G -n lv_workareas vg_datos
sudo lvcreate -L +512M -n lv_swap vg_temp
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker
sudo mount /dev/mapper/vg_datos-lv_workareas /work
sudo swapon /dev/mapper/vg_temp-lv_swap
sudo systemctl restart docker
