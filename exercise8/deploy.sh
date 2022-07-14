docker kill $(docker ps  -f ancestor=mitmproxy/mitmproxy -q)
docker run -d --rm -v $PWD/$1/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0
while ! $(docker inspect -f {{.State.Running}} $(docker ps  -f ancestor=mitmproxy/mitmproxy -q)) ; do sleep 0.1; done;
sleep 5
docker secret create hub-exercise_HUB_PROXY_CERT_FILE $PWD/$1/.mitmproxy/mitmproxy-ca-cert.pem
sed -i 's/sHUB_PROXY_HOST=EMPTY/HUB_PROXY_HOST=$(hostname)/' $1/blackduck-config.env
docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
