sudo apt-get update -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin certbot ssl-cert python3-poetry -y
sudo apt-get upgrade -y

# add root to docker group
sudo groupadd docker
sudo usermod -aG docker $USER


# you should have docker and docker compose installed, and 30+ GB of free disk space
# as a reference, we used Amazon EC2 t3.2xlarge instances for baselines
# Mac users must have host networking enabled
sudo chmod 666 /var/run/docker.sock
#curl -fsSL https://github.com/TheAgentCompany/the-agent-company-backup-data/releases/download/setup-script-20241208/setup.sh | sh

sudo echo "127.0.0.1 the-agent-company.com"  >> /etc/hosts
