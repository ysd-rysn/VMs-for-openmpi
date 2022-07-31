# VMs-for-openmpi

## Hello World
1. `vagrant up`
2. `vagrant ssh node1`
3. Register other nodes in `~/.ssh/known_hosts`
4. `mpicc -o mpihello /vm_share/mpihello.c` 
5. `mpirun --hostfile /vm_share/hostfile -np "number of VMs created" ./mpihello`

## Usage
- Modify `NUM_VMS` to change number of VMs
