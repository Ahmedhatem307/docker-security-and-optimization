#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

GITHUB_REPO=$1
DOCKER_IMAGE=$2

echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin || exit 1

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

git clone "https://github.com/$GITHUB_REPO.git" "$TEMP_DIR/repo" || exit 1

docker build -t "$DOCKER_IMAGE" "$TEMP_DIR/repo" || exit 1

docker push "$DOCKER_IMAGE" || exit 1

echo "Successfully published $DOCKER_IMAGE"
