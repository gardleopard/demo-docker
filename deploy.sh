#!/bin/bash
docker stop $(docker ps | tail -1 | awk ' {print $1}') 2&>1 > /dev/null

read IMAGE_ID CALLBACK_URL <<<$(curl http://localhost:8088/visma-demo/dev/deployment.plain)
docker run -d -p 8888:80 $IMAGE_ID
URL="$CALLBACK_URL/local-docker/success"
curl  -s --connect-timeout 2 -X POST $URL -o -