#include <stdio.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    int nprocs, rank, namelen;
    char name[MPI_MAX_PROCESSOR_NAME];

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Get_processor_name(name, &namelen);
    printf("Hello! I am %s. My rank is %d/%d\n", name, rank, nprocs);
    MPI_Finalize();

    return 0;
}