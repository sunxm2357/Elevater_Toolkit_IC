#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=vit_cifar10_fullset_lp
#SBATCH --partition=hipri
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=12
#SBATCH  --account all

#SBATCH --error=log_cifar10_fullset_lp.e.log
#SBATCH --output=log_cifar10_fullset_lp.o.log

OUTPUT_DIR=/checkpoints/sunxm/output/evaluations
MODEL_CFG=clip_vit_distill
MODE=linear_probe
CKPT=/checkpoints/sunxm/output/EfficientVLPTask/image_text_unpaired_v2/in21k_cc15m_yfcc14m_origin_offline_feat_768_amp3-lr0.0008-wd0.05-bs12288-clip0.0-g16/clip_ViT-B32-in21k-cc15m-yfcc14m-distill-768-offline-feat-amp3.yaml_conf~/run_1/324800/default/model_state_dict.pt

cd /fsx/sunxm/code/Elevater_Toolkit_IC

OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG MODE=$MODE CKPT=$CKPT DATASET=cifar10  bash run_multi.sh