#!/usr/bin/bash

echo "Removing Any Existing api Container..."
docker container rm -f api || true
echo "Removing Any Existing test-net network"
docker network rm test-net || true

echo "Deploying app ($registry:$BUILD_NUMBER)..."
docker network create test-net

docker container run -d \
  --name api \
  --net test-net \
  $registry:$BUILD_NUMBER

read -d '' wait_for << EOF
echo "Waiting for API to listen on PORT 3000 ..."
while ! nc -z api 3000; do
  sleep 0.1
  printf "."
done
echo "API ready on port 3000!"
EOF

docker container run --rm \
  --net test-net \
  node:12.10-alpine sh -c "$wait_for"

echo "Smoke tests..."

docker container run --name tester \
  --rm \
  --net test-net \
  thangpham7793/node-docker sh -c "curl api:3000"