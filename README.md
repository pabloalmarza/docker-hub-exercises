# BlackDuck server practice

Bundle of exercises for BlackDuck troubleshooting on Docker


## Requirements

All the scenarios use the same resource and software requirements as BD 2022.4.2 with the 10sph.yaml sizing (34 Gb, 10 Gb of disk space at least).
Running the process as root is recomended

## Restrictions

If there is another stack running on the same server, it is strongly recommended to stop it and back up the data. The deployment and deletion proceses may interact with the current stack


## Instruction 

Clone the repository and change make the deployment and delete scripts executable:

```
git clone https://github.com/pabloalmarza/docker-hub-exercises.git
```
```
cd docker-hub-exercises
chmod 777 deploy.sh delete.sh
```

To start an scenario, just run the deploy script with the number of the scenario. For example, to launch scenario 1:


```
./deploy.sh 1
```

To end the scenario and delete the stack and associated elements created, just use the delete script:

```
./delete.sh
```

Note: the outputs of the scripts both to create and delte the scnearios are not optimized, so plenty warnings or messages may be displayed, just ignore them
