docker secret create hub-exercise_WEBSERVER_CUSTOM_CERT_FILE $1/cert.cer
docker secret create hub-exercise_WEBSERVER_CUSTOM_KEY_FILE $1/key.pem
docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
