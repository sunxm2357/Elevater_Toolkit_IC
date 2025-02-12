#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=vit_taskaware_cifar100_fullset_lp
#SBATCH --partition=learnai4rl
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH  --account all


#SBATCH --error=log_cifar100_fullset_lp.e.log
#SBATCH --output=log_cifar100_fullset_lp.o.log

OUTPUT_DIR=/checkpoints/sunxm/output/evaluations
MODEL_CFG=clip_vit_distill
MODE=linear_probe
CKPT=/checkpoints/sunxm/output/EfficientVLPTaskNew/image_text_unpaired_v2/in21k-cc15m-yfcc14m-512-taskaware_in1k-lr0.0008-wd0.05-bs12288-clip0.0-g24/clip_ViT-B32-in21k-cc15m-yfcc14m-512-taskaware_in1k.yaml_conf~/run_1/324800/default/model_state_dict.pt

cd /fsx/sunxm/code/Elevater_Toolkit_IC

MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG CKPT=$CKPT DATASET=cifar100  bash run_multi.sh