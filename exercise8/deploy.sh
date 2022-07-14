docker kill $(docker ps  -f ancestor=mitmproxy/mitmproxy -q)
docker run -d --rm -v $1/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0
while ! $(docker inspect -f {{.State.Running}} $(docker ps  -f ancestor=mitmproxy/mitmproxy -q)) ; do sleep 0.1; done;
docker secret create hub-exercise_HUB_PROXY_CERT_FILE $1/.mitmproxy/mitmproxy-ca-cert.pem
sed -i 's/sHUB_PROXY_HOST=/HUB_PROXY_HOST=$(hostname)/'
docker stack deploy -c $1/docker-compose_2.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise