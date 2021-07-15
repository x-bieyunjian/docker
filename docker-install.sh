echo -e "\033[43;35m Install dependencies \033[0m"
sudo yum install -y yum-utils device-mapper-persistent-data
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

echo -e "\033[43;35m docker installing \033[0m"
sudo yum -y install docker-ce
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://f2jwd1fo.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
echo -e "\033[43;35m docker install successfully \033[0m"

echo -e "\033[43;35m docker-compose install \033[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo -e "\033[43;35m docker-compose install successfull \033[0m"