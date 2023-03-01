# 130 GPU
# docker pull pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

# ---------- ghost ×----------

#FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel
#
#RUN echo "" > /etc/apt/sources.list.d/cuda.list
#RUN sed -i "s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
#RUN sed -i "s@/security.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
#RUN apt-get update --fix-missing && apt-get install -y fontconfig --fix-missing
#RUN apt-get install -y cmake
#RUN apt-get install -y vim
#RUN apt-get install -y git
#RUN apt-get install -y wget
#RUN apt-get install -y python3.7 python3-pip
#RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scipy matplotlib seaborn h5py sklearn numpy==1.20.3 pandas==1.3.5 requests==2.25.1
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytorch_lightning==1.8.1 lightning==1.8.1 deepspeed==0.7.5
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple onnx==1.12.0 onnxruntime-gpu==1.12
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple huggingface_hub==0.10.1 transformers==4.23.1 diffusers==0.6.0
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple accelerate==0.11.0 modelcards==0.1.6
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
#RUN apt-get install libgl1-mesa-glx -y
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mxnet-cu101mkl
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-image
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple insightface
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple kornia
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple dill
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple wandb
#
#WORKDIR /home
#
## cd /data/wgs/face_swap
## docker build -t wgs-torch/faceswap:1.0 -f ./dk/Dockerfile .
## docker run --gpus '"device=1"' --rm -it --name test wgs-torch/FaceSwap:1.0 bash

#FROM wgs-torch/faceswap:1.0
#
#RUN apt-get install libgl1-mesa-glx -y
#
#WORKDIR /home

# ---------- ghost ----------
#FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#
#RUN echo "" > /etc/apt/sources.list.d/cuda.list
#RUN sed -i "s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
#RUN sed -i "s@/security.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list
#RUN apt-get update --fix-missing && apt-get install -y fontconfig --fix-missing
#RUN apt-get install -y vim
#RUN apt-get install -y python3.7 python3-pip
#RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scipy matplotlib seaborn h5py sklearn numpy==1.20.3 pandas==1.3.5
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
#RUN apt-get install libgl1-mesa-glx -y
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple onnx==1.9.0 onnxruntime-gpu==1.4.0
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mxnet-cu101mkl
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-image insightface==0.2.1 requests==2.25.1 kornia==0.5.4 dill wandb
#
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple protobuf==3.19.0
#
#WORKDIR /home
#
## cd /data/wgs/face_swap
## docker build -t wgs-torch/faceswap:3.0 -f ./dk/Dockerfile .
## docker run --gpus '"device=1"' --rm -it --name test wgs-torch/FaceSwap:1.0 bash
#
#FROM wgs-torch/faceswap:3.0
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple protobuf==3.19.0
#WORKDIR /home

# docker build -t wgs-torch/faceswap:ghost -f ./dk/Dockerfile .

FROM wgs-torch/faceswap:ghost
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ffmpeg
WORKDIR /home

# docker build -t wgs-torch/faceswap:ghost1 -f ./dk/Dockerfile .

FROM wgs-torch/faceswap:ghost
RUN apt-get install ffmpeg -y
WORKDIR /home

# docker build -t wgs-torch/faceswap:ghost1 -f ./dk/Dockerfile .





