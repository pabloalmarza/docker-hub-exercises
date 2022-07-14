docker stack deploy -c $1/docker-compose.yml -c $1/docker-compose.local-overrides.yml -c $1/10sph.yaml hub-exercise
while ! $(docker inspect -f {{.State.Running}} $(docker ps  -f name="postgres.1" -q)) ; do sleep 0.1; done;
docker exec -it $(docker ps  -f name="postgres.1" -q) psql -U blackduck -d bds_hub -c "update st.usermgmt_enduser set active='t' where name='sysadmin';"
