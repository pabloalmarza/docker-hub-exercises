exercise="exercise$1";
stack=hub-exercise
if [ -d $exercise ]
then
  if [ $1 = "3" ]
  then
    docker secret create hub-exercise_WEBSERVER_CUSTOM_CERT_FILE $exercise/cert.cer
    docker secret create hub-exercise_WEBSERVER_CUSTOM_KEY_FILE $exercise/key.pem
  fi
  docker stack deploy -c $exercise/docker-compose.yml -c $exercise/docker-compose.local-overrides.yml -c $exercise/10sph.yaml hub-exercise
else
  echo "Error: Directory $exercise does not exists."
fi
