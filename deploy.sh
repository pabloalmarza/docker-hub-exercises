exercise="exercise$1";
if [ -d $exercise ]
then
	chmod 777 $exercise/deploy.sh
	/bin/bash $exercise/deploy.sh $exercise
else
  echo "Error: Directory $exercise does not exists."
fi
