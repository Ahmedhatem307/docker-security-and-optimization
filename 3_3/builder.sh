#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

GITHUB_REPO=$1
DOCKER_IMAGE=$2

git clone "https://github.com/$GITHUB_REPO.git" || exit 1

REPO_NAME=$(basename "$GITHUB_REPO")

cd "$REPO_NAME" || exit 1
docker build -t "$DOCKER_IMAGE" . || exit 1

docker push "$DOCKER_IMAGE" || exit 1
