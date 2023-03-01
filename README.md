# face_swap

基于 GHOST-A 的AI视频换脸

我公众号：WGS的学习笔记

![](./tmp.jpg)

博客地址：https://wangguisen.blog.csdn.net/article/details/129244166

paper：https://arxiv.org/pdf/2202.03046

这篇文章的工作是在 FaceShifter 为 baseline 上进行的，提出了：

- 新的 eye-based 损失；
- 新的 face mask 平滑方法；
- 新的视频人脸交换pipeline；
- 新的用于减少相邻帧和SR阶段面部抖动的稳定技术。

git：https://github.com/ai-forever/ghost

支持 【视频里单个人脸转换】、【视频里多个人脸转换】、【图片[换脸](https://so.csdn.net/so/search?q=换脸&spm=1001.2101.3001.7020)】、【训练换脸模型】



本项目生成视频效果：

链接: https://pan.baidu.com/s/1aAK6EnPmWuQ4eHTauFMANg?pwd=g85s 提取码: g85s 
--来自百度网盘超级会员v1的分享



# dockerfile

```
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

RUN echo "" > /etc/apt/sources.list.d/cuda.list
RUN sed -i "s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
RUN sed -i "s@/security.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
RUN apt-get update --fix-missing && apt-get install -y fontconfig --fix-missing
RUN apt-get install -y vim
RUN apt-get install -y python3.7 python3-pip
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scipy matplotlib seaborn h5py sklearn numpy==1.20.3 pandas==1.3.5

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
RUN apt-get install libgl1-mesa-glx -y

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple onnx==1.9.0 onnxruntime-gpu==1.4.0

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mxnet-cu101mkl

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-image insightface==0.2.1 requests==2.25.1 kornia==0.5.4 dill wandb

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple protobuf==3.19.0

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ffmpeg

RUN apt-get install ffmpeg -y

WORKDIR /home

# docker build -t wgs-torch/faceswap:ghost -f ./dk/Dockerfile .
```



# 下载权重

```
# cd

# load arcface
wget -P ./arcface_model https://github.com/sberbank-ai/sber-swap/releases/download/arcface/backbone.pth
wget -P ./arcface_model https://github.com/sberbank-ai/sber-swap/releases/download/arcface/iresnet.py

# load landmarks detector
wget -P ./insightface_func/models/antelope https://github.com/sberbank-ai/sber-swap/releases/download/antelope/glintr100.onnx
wget -P ./insightface_func/models/antelope https://github.com/sberbank-ai/sber-swap/releases/download/antelope/scrfd_10g_bnkps.onnx

# load G and D models with 1, 2, 3 blocks
# model with 2 blocks is main
wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/G_unet_2blocks.pth
wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/D_unet_2blocks.pth

wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/G_unet_1block.pth
wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/D_unet_1block.pth

wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/G_unet_3blocks.pth
wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/sber-swap-v2.0/D_unet_3blocks.pth

# load model for eyes loss
wget -P ./AdaptiveWingLoss/AWL_detector https://github.com/sberbank-ai/sber-swap/releases/download/awl_detector/WFLW_4HG.pth

# load super res model
wget -P ./weights https://github.com/sberbank-ai/sber-swap/releases/download/super-res/10_net_G.pth
```



# shell

```
#!/bin/bash
today=$(date -d "now" +%Y-%m-%d)
yesterday=$(date -d "yesterday" +%Y-%m-%d)

cd /data/wgs/face_swap/ghost

## 视频里一个人脸
#SOURCE_PATHA="\
#            --source_paths ./examples/images/p1.jpg \
#           "
#
#VIDEO_PATH="\
#          --target_video ./examples/videos/inVideo1.mp4 \
#          --out_video_name ./examples/results/o1_1_1.mp4 \
#          "

# 视频里多个人脸
SOURCE_PATHA="\
            --source_paths ./examples/images/p1.jpg ./examples/images/p2.jpg \
            --target_faces_paths ./examples/images/tgt1.png ./examples/images/tgt2.png \
           "

VIDEO_PATH="\
           --target_video ./examples/videos/dirtydancing.mp4 \
          --out_video_name ./examples/results/o_multi.mp4 \
          "

options=" \
        $SOURCE_PATHA \
        $VIDEO_PATH \
        "

docker run -d --gpus '"device=1"' \
       --rm -it --name face_swap \
       --shm-size 15G \
       -v /data/wgs/face_swap:/home \
       wgs-torch/faceswap:ghost \
       sh -c "python3 /home/ghost/inference.py $options 1>>/home/log/ghost.log 2>>/home/log/ghost.err"

# nohup sh /data/wgs/face_swap/dk/ghost.sh &
```

