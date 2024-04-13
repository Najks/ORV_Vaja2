#!/bin/bash

# Definicija imena in oznake Docker slike
IMAGE_NAME="yourusername/imagename:tag"

# Kreiranje novega direktorija za repozitorij
REPO_DIR="docker_27593_repo"
mkdir -p $REPO_DIR
cd $REPO_DIR

# Prenos Docker slike
echo "Prenašanje Docker slike..."
docker pull $IMAGE_NAME

# Zagon Docker vsebnika
echo "Zagon Docker vsebnika..."
docker run -d --name my_app_container $IMAGE_NAME

# Preverjanje, ali vsebnik teče
if [ "$(docker inspect -f '{{.State.Running}}' my_app_container)" = "true" ]; then
    echo "Vsebnik se uspešno izvaja."
else
    echo "Napaka pri zagonu vsebnika."
    exit 1
fi

# Počakaj nekaj sekund, da se vsebnik stabilizira (neobvezno)
sleep 10

# Očisti: Ustavi in odstrani vsebnik
echo "Čiščenje..."
docker stop my_app_container
docker rm my_app_container

# Izhod iz direktorija in njegova odstranitev
cd ..
rmdir $REPO_DIR

echo "Postopek zaključen."
