# Installing Docker 
# Add Docker's official GPG key:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

# Add the repository to Apt sources:
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

# Installing the latest version of Docker Engine 
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

# To know if its working
```
sudo docker run hello-world
```

# To building and pushing of the docker image
```
docker build -t bit3down/nodejs-app .

docker tag bit3down/nodejs-app bit3down/nodejs-app:latest

docker push bit3down/nodejs-app:latest
```

# Then to run it 
```
docker run -p 3000:3000 my-nodejs-app
```