#cloud-config
timezone: Europe/Helsinki
users:
  - name: minecraft
    groups: users, admin
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      - ${ssh_key}
package_update: true
package_upgrade: true
write_files:
  - content: |
      network:
        version: 2
        ethernets:
          eth0:
            addresses:
            - ${public_ip}/32
    path: /etc/netplan/60-floating-ip.yaml
runcmd:
  - locale-gen fi_FI.utf8
  - loadkeys fi
  - sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
  - sed -i -e '/^PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
  - sed -i -e '/^X11Forwarding/s/^.*$/X11Forwarding no/' /etc/ssh/sshd_config
  - sed -i -e '/^#MaxAuthTries/s/^.*$/MaxAuthTries 2/' /etc/ssh/sshd_config
  - sed -i -e '/^#AllowTcpForwarding/s/^.*$/AllowTcpForwarding no/' /etc/ssh/sshd_config
  - sed -i -e '/^#AllowAgentForwarding/s/^.*$/AllowAgentForwarding no/' /etc/ssh/sshd_config
  - sed -i -e '/^#AuthorizedKeysFile/s/^.*$/AuthorizedKeysFile .ssh/authorized_keys/' /etc/ssh/sshd_config
  - sed -i -e '/^#Port/s/^.*$/Port 4567/' /etc/ssh/sshd_config
  - sed -i '$a AllowUsers minecraft' /etc/ssh/sshd_config
  - systemctl restart sshd
  - systemctl restart ssh
  - netplan apply
