#!/bin/bash

#SBATCH --job-name=lammps_test
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=00:20:00
#SBATCH --partition=standard
#SBATCH --qos=short
#SBATCH --output=lammps_test.out

# Ensure the cpus-per-task option is propagated to srun commands
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

set -e 

module use modules
VERSION=0.23.0
module load spack/$VERSION
spack load lammps

cd lammps_test

srun --distribution=block:block --hint=nomultithread lmp -i in.ethanol