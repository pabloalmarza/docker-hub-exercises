stack=hub-exercise
echo "Deleting stack $stack"
docker stack rm $stack
docker secret rm $(docker secret ls --filter name=$stack -q)
docker image rm blackducksoftware/blackduck-cfssl:1.0.7
while [[ $(docker ps | grep hub-exercise | wc -l) != "0" ]] ;
do
 echo $(docker ps | grep hub-exercise | wc -l) "Containers still active"
 sleep 4;
done

sleep 6
docker volume rm $(docker volume ls -q | grep $stack)
