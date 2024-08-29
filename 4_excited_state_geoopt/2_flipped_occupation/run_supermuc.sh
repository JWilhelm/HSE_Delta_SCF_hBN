#!/bin/bash
# Job Name and Files (also --job-name)
#SBATCH -J benzene

#Output and error (also --output, --error):
#SBATCH -o ./%x.%j.out
#SBATCH -e ./%x.%j.err

#Initial working directory (also --chdir):
#SBATCH -D ./

# Change here the job size and time limit:
#SBATCH --time=00:30:00
#SBATCH --nodes=16
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=test
#SBATCH --no-requeue
#SBATCH --exclude=i01r01c01s[05,07-12],i01r01c02s[01-09]

#Setup of execution environment
#SBATCH --export=NONE
#SBATCH --get-user-env
#SBATCH --account=pn36zo

module load slurm_setup

module load cp2k

export OMP_NUM_THREADS=1

mpiexec -n $SLURM_NTASKS cp2k.popt *inp &> cp2k.out
