#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -p GPU-shared
#SBATCH -t 10:00:00
#SBATCH --gres=gpu:1

source ~/.bashrc
module load cuda/10.2.0

conda activate gpu
# pip list
# which python
# nvcc --version

cd /jet/home/jshah2/HW3/NNI_HyperParam_Optimization
# nnictl view
python3 main.py Evolution config_1 tuner_version_1
python3 main.py Evolution config_2 tuner_version_1
python3 main.py TPE config_1 tuner_version_1
python3 main.py TPE config_2 tuner_version_1
python3 main.py SMAC config_1 tuner_version_1
python3 main.py SMAC config_2 tuner_version_1


python3 main.py Evolution config_1 tuner_version_2
python3 main.py Evolution config_2 tuner_version_2
python3 main.py TPE config_1 tuner_version_2
python3 main.py TPE config_2 tuner_version_2
python3 main.py SMAC config_1 tuner_version_2
python3 main.py SMAC config_2 tuner_version_2