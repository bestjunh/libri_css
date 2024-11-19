# nvidia-docker run -v `pwd`:`pwd` -w `pwd` --shm-size=32G -i -t pykaldi2docker/horovod-pykaldi:libcss.v1.0
# docker run --gpus '"device=1"' -v `pwd`:`pwd` -w `pwd` --shm-size=32G -i -t pykaldi2docker/horovod-pykaldi:libcss.v1.0
docker run --gpus all -v `pwd`:`pwd` -w `pwd` --shm-size=32G -i -t pykaldi2docker/horovod-pykaldi:libcss.v1.0



