docker run \
    -v $(pwd):/var/loadtest \
    -v $(pwd)/ssh:/root/.ssh \
    --net host \
    --entrypoint /bin/bash \
    -it direvius/yandex-tank
