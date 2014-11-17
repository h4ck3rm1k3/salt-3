#!/bin/bash
check_opt(){
if [ -z "$os" ];then
    echo "USAGE: $0 Ubuntu 10.04 minimal"
    exit 1
fi
if [ -z "$ver" ];then
    echo "USAGE: $0 Ubuntu 10.04 minimal"
    exit 1
fi
if [ -z "$role" ];then
    echo "USAGE: $0 Ubuntu 10.04 minimal"
    exit 1
fi
}

download_files(){
####################################################################
# download new os files
####################################################################
test -d $boot_dir/$inst_os && rm -rf $boot_dir/$inst_os
mkdir $boot_dir/$inst_os
wget -q -P "$boot_dir/$inst_os" $src_vmlinuz
wget -q -P "$boot_dir/$inst_os" $src_initrd
}

add_menu(){
####################################################################
# add & set new menu
####################################################################
sed -i '/^menuentry/,$d' $grub_conf
sed -i '/GRUB_DEFAULT/s/0/4/' /etc/default/grub

echo 'menuentry "$inst_os x86_64 $role" {' >> $grub_conf
echo "    set root='(hd0,0)'" >> $grub_conf
echo "    linux /$inst_os/linux" >> $grub_conf
echo "    initrd /$inst_os/initrd.gz" >> $grub_conf
echo "}" >> $grub_conf
update-grub2 > /dev/null
}

grub_conf="/etc/grub.d/40_custom"
os=$1
ver=$2
role=$3
inst_os="$1-$2-$3"
boot_dir="/boot"
dst_vmlinuz="linux"
dst_initrd="initrd.gz"

src_path="http://ftp01.hdtr.com/os/Linux/Debian"
src_vmlinuz="$src_path/$os/x86_64/$ver/install/netboot/ubuntu-installer/amd64/linux"
src_initrd="$src_path/$os/x86_64/$ver/install/netboot/ubuntu-installer/amd64/initrd.gz"
#src_preseed="http://pxe.hdtr.com/pxe/BOOT"

#sed -i '/Install/,$d' $grub_conf
check_opt
download_files
add_menu
