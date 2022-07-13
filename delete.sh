stack=hub-exercise
echo "Deleting stack $stack"
docker stack rm $stack
while [[ $(docker ps | grep hub-exercise | wc -l) != "0" ]] ;
do
 echo $(docker ps | grep hub-exercise | wc -l) "Containers still active"
 sleep 4;
done

sleep 6
