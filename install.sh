#!/bin/bash


echo "* Installing base packages [qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils netcat-openbsd libguestfs]"
echo "Continue? [y/n]"
read b

if [[ $b == y ]]; then
	sudo apt install qemu -y
	sudo apt install virt-manager -y
	sudo apt install virt-viewer -y
	sudo apt install dnsmasq -y
	sudo apt install vde2 -y
	sudo apt-get install bridge-utils -y

	#sudo apt install openbsd-netcat -y
	sudo apt install netcat-openbsd -y

	# cant find libguestfs for debian 10, accoring to some websites it is "imported into rolling" so that could mean it is already installed?
	sudo apt install libguestfs -y
fi

echo
echo "Install extra packages? (recommended)"
echo "Continue? [y/n]"
read i
if [[ $i == y ]];then
# Install this for uefi
	sudo apt install ovmf
# Install this for TPM module emulation (installation is a pain in the a**)
#	sudo apt-get install swtpm-dev
fi

echo
echo "* Starting & Enabling libvirtd service"
echo "Continue [y/n]"
read a
if [[ $a == y ]]; then
	sudo systemctl start libvirtd
	sudo systemctl enable libvirtd
fi

echo
echo "* Make sure these settings are uncommented and correct:"
echo '* unix_sock_group = "libvirt"'
echo '* unix_sock_ro_perms = "0777"'
echo '* unix_sock_rw_perms = "0770"'
echo "Understood and Continue? [y/n]"
read h
if [[ $h == y ]]; then
	echo
	echo "Opening linbvirtd conf file..."
	sudo nano /etc/libvirt/libvirtd.conf
fi

echo
echo "* Adding user to libvirt group..."
echo "* For these changes to take affect you might have to reboot or log out (you will be prompted later)."
echo "Continue? [y/n]"
read u
if [[ $u == y ]]; then
	echo "Enter username to add to libvirt group."
	read user
	sudo usermod -aG libvirt $user
	echo "Restarting libvirtd service.."
	systemctl restart libvirtd
fi

echo
echo "* Rebooting is optional, my install worked without it."
echo "Reboot now? [y/n]"
read p
if [[ $p == y ]]; then
	sudo shutdown -r 0
fi

