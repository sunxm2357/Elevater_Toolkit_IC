#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=vit_small_datasets1_fullset_lp
#SBATCH --partition=hipri
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH  --account all

#SBATCH --error=log_small_datasets1_fullset_lp.e.log
#SBATCH --output=log_small_datasets1_fullset_lp.o.log

OUTPUT_DIR=/checkpoints/sunxm/output/evaluations
MODEL_CFG=clip_vit_distill
MODE=linear_probe
CKPT=/checkpoints/sunxm/output/EfficientVLPTask/image_text_unpaired_v2/in21k_cc15m_yfcc14m_origin_offline_feat_768_taskaware10-lr0.0008-wd0.05-bs12288-clip0.0-g16/clip_ViT-B32-in21k-cc15m-yfcc14m-distill-768-offline-feat_taskaware10.yaml_conf~/run_1/324800/default/model_state_dict.pt

cd /fsx/sunxm/code/Elevater_Toolkit_IC

# 1
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=caltech101  bash run_multi.sh
# 2
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=dtd  bash run_multi.sh
# 3
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=eurosat-clip  bash run_multi.sh
#4
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=fer2013  bash run_multi.sh
#5
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=flower102  bash run_multi.sh
# 6
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=gtsrb  bash run_multi.sh
# 7
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=hateful-memes  bash run_multi.sh
# 8
MODE=$MODE OUTPUT_DIR=$OUTPUT_DIR MODEL_CFG=$MODEL_CFG  CKPT=$CKPT DATASET=kitti-distance  bash run_multi.sh
