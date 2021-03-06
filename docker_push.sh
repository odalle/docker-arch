#!/bin/sh

set -e
. ./build_params.sh

docker push ${docker_image}:latest
docker tag ${docker_image}:latest $docker_image:$(docker run -it --rm --entrypoint /bin/sh $docker_image -c 'echo -n ${BUILD_DATE}_${KERNEL_VERSION}')
docker push $docker_image:$(docker run -it --rm --entrypoint /bin/sh $docker_image -c 'echo -n ${BUILD_DATE}_${KERNEL_VERSION}')

