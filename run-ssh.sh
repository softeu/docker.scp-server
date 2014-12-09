#!/bin/bash


    if [ ! -d /var/run/sshd ]; then
        mkdir /var/run/sshd
        chmod 0755 /var/run/sshd
    fi

mkdir -p /home/data/.ssh && chown -R data:data /home/data/.ssh

cd /authorized_keys

touch /home/data/.ssh/authorized_keys
for I in *
do
  cat $I >> /home/data/.ssh/authorized_keys
done

chown -R data:data /home/data/.ssh/authorized_keys /data
chmod og-rwx /home/data/.ssh/authorized_keys


exec /usr/sbin/sshd -D -e

