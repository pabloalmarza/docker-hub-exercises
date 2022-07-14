# BlackDuck server practice

Bundle of exercises for BlackDuck troubleshooting on Docker


## Requirements

All the scenarios use the same resource and software requirements as BD 2022.4.2 with the 10sph.yaml sizing (34 Gb, with only 10 Gb of disk space really required).
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

## Completing an scenario

The end goal for each scenario is to be able to upload the test.bdio file on the UI and see the list of results in the BOM. The list will contain 7 components.

The deployment files used for each scenario are included in the individual folder, but it is recommended to try to reach the solution or as close as possible to the solution based on other methods, as these scenarios are designed to simulate real world problems where hte problem itself will not be evident.
Each scenario folder contains also a file with the explanation and a possible route to reach it. 

## Difficulty

Each scenario has a different difficulty level and therefore a recommended audience, even if you're a novice you can try to have a go at the last one.



