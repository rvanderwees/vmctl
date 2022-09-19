# Wrapper script to control the creation and cloning of template VMs using virsh / virt-install / virt-clone / virt-sysprep wrapper

### Requirements

This script is based and test on a Fedora host (other distro may also work) and requires:

1. Python
1. qemu-kvm + libvirt + libguestfs

        $ sudo dnf install @virtualization virt-install guestfs-tool

1. sudo access to run virsh / virt-install / virt-clone / virt-sysprep / mv

### Setup

The setup script will ask the `root` and `user1` password and update the kickstart templates before copying them into `$HOME/.local/kickstart` together with `vmctl` in `$HOME/.local/bin`

    $ bash setup.sh

