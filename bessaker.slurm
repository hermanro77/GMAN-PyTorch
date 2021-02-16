#!/bin/sh
#SBATCH --partition=GPUQ
#SBATCH --account=ie-idi
#SBATCH --time=10:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:P100:1
#SBATCH --job-name="LBM_CUDA"
#SBATCH --output=logs/GMAN_bessaker_w_wind.out

cd ${SLURM_SUBMIT_DIR}

module purge
module load fosscuda/2018b
mpirun hostname

mpirun python main.py --SE_file './data/SE(Bessaker)_with_wind.txt' --traffic_file ./data/Bessaker.h5 --model_file ./GMAN_Bessaker_w_wind.pkl
