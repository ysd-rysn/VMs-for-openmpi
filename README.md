# VMs-for-openmpi

## Hello World
1. `vagrant up`でVMを起動
2. `vagrant ssh node1`でnode1に接続
3. ~/.ssh/known_hostsへ他のnodeを登録(作成した台数分)
4. `mpicc -o mpihello /vm_share/mpihello.c` 
5. `mpirun --hostfile /vm_share/hostfile -np "作成したVMの台数" ./mpihello`

## Usage
- VMの台数を変更するには，Vagrantfileの`NUM_VMS`の値を変更する