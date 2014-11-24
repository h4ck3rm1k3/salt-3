#!/bin/bash
check_opt(){
if [ -z "$os" ];then
    echo "USAGE: $0 CentOS 6.5 minimal"
    exit 1
fi
if [ -z "$ver" ];then
    echo "USAGE: $0 CentOS 6.5 minimal"
    exit 1
fi
if [ -z "$role" ];then
    echo "USAGE: $0 CentOS 6.5 minimal"
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
sed -i '/^default/s/0/1/' $grub_conf

echo "title Install $inst_os" >> $grub_conf
echo -e "\troot (hd0,0)" >> $grub_conf
echo -e "\tkernel /$inst_os/vmlinuz repo=$src_path/$os/x86_64/$ver ks=$src_ks/ks.php?role=minimal" >> $grub_conf
echo -e "\tinitrd /$inst_os/initrd.img" >> $grub_conf
}

grub_conf="/boot/grub/grub.conf"
os=$1
ver=$2
role=$3
inst_os="$1-$2-$3"
boot_dir="/boot"
dst_vmlinuz="vmlinuz"
dst_initrd="initrd.img"

src_path="http://ftp01.hdtr.com/os/Linux/RedHat"
src_vmlinuz="$src_path/$os/x86_64/$ver/images/pxeboot/vmlinuz"
src_initrd="$src_path/$os/x86_64/$ver/images/pxeboot/initrd.img"
src_ks="http://pxe.hdtr.com/pxe/BOOT"

sed -i '/Install/,$d' $grub_conf
check_opt
download_files
add_menu
