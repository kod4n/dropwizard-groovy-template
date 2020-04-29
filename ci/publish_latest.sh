#!/bin/bash

set -o nounset
set -o errexit

## setup different build args if the build is for a snapshot or a tag
echo "[travis_deploy] uploading maven artifact snapshot"
echo "docker build --build-arg TRAVIS=${TRAVIS} --build-arg TRAVIS_JOB_ID=${TRAVIS_JOB_ID}
             --build-arg JFROG_DEPLOY_USER=${JFROG_DEPLOY_USER} --build-arg JFROG_DEPLOY_KEY=${JFROG_DEPLOY_KEY}
             --target publish ."
#docker build --build-arg "TRAVIS=${TRAVIS}" --build-arg "TRAVIS_JOB_ID=${TRAVIS_JOB_ID}" \
#             --build-arg "JFROG_DEPLOY_USER=${JFROG_DEPLOY_USER}" --build-arg "JFROG_DEPLOY_KEY=${JFROG_DEPLOY_KEY}" \
#             --target publish .

docker_tag="latest"

echo "[travis_deploy] dockerhub push for tag [${docker_tag}]"
#echo "${DOCKERHUB_PASS}" | docker login -u="${DOCKERHUB_USER}" --password-stdin
echo "docker push ${TRAVIS_REPO_SLUG}:${docker_tag}"
#docker push "${TRAVIS_REPO_SLUG}:${docker_tag}"

echo "[travis_deploy] quay.io push for tag [${docker_tag}]"
#echo "${QUAYIO_PASS}" | docker login -u="${QUAYIO_USER}" --password-stdin quay.io
echo "docker push quay.io/${TRAVIS_REPO_SLUG}:${docker_tag}"
#docker push "quay.io/${TRAVIS_REPO_SLUG}:${docker_tag}"
