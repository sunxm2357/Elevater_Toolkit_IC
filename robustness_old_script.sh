#!/bin/bash

cd vision_benchmark
output_dir=/research/sunxm/output/evaluations/

CUDA_VISIBLE_DEVICES=$2 python commands/zeroshot.py --ds resources/datasets/imagenetv2.yaml  --model resources/model/vitb32_student.yaml --target local MODEL.PRETRAINED $1 DATASET.ROOT $output_dir/datasets OUTPUT_DIR $output_dir/$model_cfg/log

CUDA_VISIBLE_DEVICES=$2 python commands/zeroshot.py --ds resources/datasets/imagenet-r.yaml  --model resources/model/vitb32_student.yaml --target local MODEL.PRETRAINED $1 DATASET.ROOT $output_dir/datasets OUTPUT_DIR $output_dir/$model_cfg/log

CUDA_VISIBLE_DEVICES=$2 python commands/zeroshot.py --ds resources/datasets/objectnet.yaml  --model resources/model/vitb32_student.yaml --target local MODEL.PRETRAINED $1 DATASET.ROOT $output_dir/datasets OUTPUT_DIR $output_dir/$model_cfg/log

CUDA_VISIBLE_DEVICES=$2 python commands/zeroshot.py --ds resources/datasets/imagenet-sketch.yaml  --model resources/model/vitb32_student.yaml --target local MODEL.PRETRAINED $1 DATASET.ROOT $output_dir/datasets OUTPUT_DIR $output_dir/$model_cfg/log

CUDA_VISIBLE_DEVICES=$2 python commands/zeroshot.py --ds resources/datasets/imagenet-a.yaml  --model resources/model/vitb32_student.yaml --target local MODEL.PRETRAINED $1 DATASET.ROOT $output_dir/datasets OUTPUT_DIR $output_dir/$model_cfg/log