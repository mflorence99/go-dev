container="go-dev"
running=$(docker inspect --format='{{ .State.Running }}' $container 2> /dev/null)

if [ $(uname -s) == "Darwin" ]; then
  cached=":cached"
fi

if [ "$running" != "true" ]; then

  docker rm -f "${container}"

  docker run \
    --dns 8.8.8.8 \
    --name "${container}" \
    --net dev.net \
    -h localhost \
    -it \
    -v "$HOME"/tmp:/temp \
    -v "$HOME"/.ssh:/root/.ssh-orig \
    -v "$HOME"/.gitconfig:/root/.gitconfig \
    -v "$HOME"/mflorence99/go-dev:/go$cached \
    mflo999/"$container"

else

  docker exec -it "$container" bash

fi
