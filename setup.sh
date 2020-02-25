# echo " ----- Criando pastas sincronizadas."
# sleep 3
# mkdir /home/vagrant/sync_files

echo " ----- Download Docker .deb package"
sleep 3

DIST=linux/ubuntu/dists
FILE_PATH=bionic/pool/stable/amd64  

FILE_DEP_0=containerd.io_1.2.6-3_amd64.deb
FILE_DEP_1=docker-ce-cli_19.03.6~3-0~ubuntu-bionic_amd64.deb
FILE=docker-ce_19.03.6~3-0~ubuntu-bionic_amd64.deb

URL_FILE_DEP_0="https://download.docker.com/$DIST/$FILE_PATH/$FILE_DEP_0"
URL_FILE_DEP_1="https://download.docker.com/$DIST/$FILE_PATH/$FILE_DEP_1"
URL_FILE="https://download.docker.com/$DIST/$FILE_PATH/$FILE"

wget --progress=bar:force $URL_FILE_DEP_0
wget --progress=bar:force $URL_FILE_DEP_1
wget --progress=bar:force $URL_FILE

echo " ----- Install Docker"
sleep 3
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a

sudo dpkg -i $FILE_DEP_0
sudo dpkg -i $FILE_DEP_1
sudo dpkg -i $FILE


echo " ----- Docker version"
sleep 3
docker --version


echo " ----- Start and Automate Docker"
sleep 3
sudo systemctl start docker
sudo systemctl enable docker


echo " ----- Update packages"
sleep 3
sudo apt-get update


echo " ----- FINISHED!"
sleep 3

#https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.6~3-0~ubuntu-bionic_amd64.deb