#!/bin/bash
today=$(date -d "now" +%Y-%m-%d)
yesterday=$(date -d "yesterday" +%Y-%m-%d)

cd /data/wgs/face_swap/ghost

#Generator_PARAMS="\
#                --G_path ./weights/G_unet_3blocks.pth \
#                --num_blocks 3 \
#                "
#--G_path ./weights/G_unet_2blocks.pth \
#--num_blocks 2 \

SOURCE_PATHA="\
            --source_paths ./examples/images/p1.jpg \
           "

# --batch_size 10 \

VIDEO_PATH="\
          --target_video ./examples/videos/inVideo1.mp4 \
          --out_video_name ./examples/results/o1_1_10.mp4 \
          "

#SOURCE_PATHA="\
#            --source_paths ./examples/images/p1.jpg ./examples/images/p2.jpg \
#            --target_faces_paths ./examples/images/tgt1.png ./examples/images/tgt2.png \
#           "
#
#VIDEO_PATH="\
#           --target_video ./examples/videos/dirtydancing.mp4 \
#          --out_video_name ./examples/results/o_multi.mp4 \
#          "

options=" \
        $SOURCE_PATHA \
        $VIDEO_PATH \
        "
#$Generator_PARAMS \

docker run -d --gpus '"device=1"' \
       --rm -it --name face_swap \
       --shm-size 15G \
       -v /data/wgs/face_swap:/home \
       wgs-torch/faceswap:ghost \
       sh -c "python3 /home/ghost/inference.py $options 1>>/home/log/ghost.log 2>>/home/log/ghost.err"

# nohup sh /data/wgs/face_swap/dk/ghost.sh &