exercise="exercise$1";
if [ -d $exercise ]
then
	chmod 777 exercise$1/deploy.sh
	/bin/bash exercise$1/deploy.sh
else
  echo "Error: Directory $exercise does not exists."
fi
