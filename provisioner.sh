#!/bin/bash

set -x

NUM_VMS=$1
SYNCED_FOLDER="/vm_share"

if [[ ! -e /etc/.provisioned ]]; then
    rm /etc/hosts $SYNCED_FOLDER/hostfile
    for i in `seq 1 $NUM_VMS`; do
        ip="192.168.56.$((100+i))"
        echo "$ip node$i" >> /etc/hosts
        echo "node$i" >> $SYNCED_FOLDER/hostfile
    done

    # 共有フォルダ内にSSHキーを生成
    if [[ ! -d $SYNCED_FOLDER/.ssh ]]; then
        mkdir $SYNCED_FOLDER/.ssh
        ssh-keygen -t rsa -f $SYNCED_FOLDER/.ssh/id_rsa -N ""
    fi

    # 共有フォルダから/home内の.sshにSSHキーをコピー
    install -m 600 -o vagrant -g vagrant $SYNCED_FOLDER/.ssh/id_rsa /home/vagrant/.ssh/

    # 改行を入れるために"echo"が必要
    (echo; cat $SYNCED_FOLDER/.ssh/id_rsa.pub) >> /home/vagrant/.ssh/authorized_keys

    # openmpi をインストール
    apt-get -y update
    apt-get -y install openmpi-bin

    touch /etc/.provisioned
fi
