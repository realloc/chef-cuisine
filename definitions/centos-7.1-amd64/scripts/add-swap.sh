#!/bin/bash -eux
fallocate -l 1G /swap
chmod 600 /swap
mkswap /swap
swapon /swap
echo '/swap   swap    swap    sw  0   0'
echo '/swap   swap    swap    sw  0   0' >> /etc/fstab
