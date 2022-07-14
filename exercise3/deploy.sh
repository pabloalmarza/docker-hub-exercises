docker secret create hub-exercise_WEBSERVER_CUSTOM_CERT_FILE cert.cer
docker secret create hub-exercise_WEBSERVER_CUSTOM_KEY_FILE key.pem
docker stack deploy -c docker-compose.yml -c docker-compose.local-overrides.yml -c 10sph.yaml hub-exercise
