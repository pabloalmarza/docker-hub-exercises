exercise="exercise$1";
stack=hub-exercise
if [ -d $exercise ]
then
  docker stack deploy -c $exercise/docker-compose.yml -c $exercise/docker-compose.local-overrides.yml -c $exercise/10sph.yaml hub-exercise
else
  echo "Error: Directory $exercise does not exists."
fi
