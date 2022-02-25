# Why do I need this?

In the past we have used Virtualbox or VMware for our virtualization needs. These 2 apps operate on the software level and therefore are a lot slower. QEMU operates from the kernel and is much faster that way (I think), almost reaching bare metal speeds with your VM's. No more are the days of slow virtualization.

Virt-manager is the front end to use QEMU.

# How do I use this?

- Only works for apt-based Linux distro's (debian, ubuntu, kali etc.)
- Make sure you have granted execute permissions for install.sh. Use `chmod u+x install.sh`
- Read the text that is presented when you run the install.sh file and follow the instructions.
- Thats it!
