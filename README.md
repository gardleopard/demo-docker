Stop:
docker stop $(docker ps | tail -1 | awk ' {print $1}') 2&>1 > /dev/null
Start: foo