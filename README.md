# neo-cli-docker
use neo-cli easy by docker

## Prepare docker environment

https://docs.docker.com/engine/installation/

```shell
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    
sudo yum install docker-ce
```



## Download source

```shell
git clone https://github.com/hzxiao/neo-cli-docker.git

cd neo-cli-docker
```



## Build docker images

- ##### For Mainnet

```shell
docker build -t neo-cli-mainnet:v2.10.2 -f Dockerfile/mainnet/v2.10.2/Dockerfile .
```

- 
  ##### For Testnet


```shell
docker build -t neo-cli-testnet:v2.10.2 -f Dockerfile/testnet/v2.10.2/Dockerfile .
```

- 
  ##### For Private net


```shell
docker build -t neo-cli-prinet:v2.10.2 -f Dockerfile/privatenet/v2.10.2/Dockerfile .
```



## Run neo-cli

- ##### For Mainnet


```shell
docker run -d -p 10332:10332 -v /home/neo/cli/0:/home/cli/Chain neo-cli-mainnet:v2.10.2
```

- ##### For Testnet


```shell
docker run -d -p 20332:20332 -v /home/neo/cli/0:/home/cli/Chain neo-cli-testnet:v2.10.2
```

- ##### For Private net


```shell
cd Dockerfile/privatenet/v2.10.2/

docker-compose up -d
```



## Neo info

- **Mainnet Cli RPC**

http://127.0.0.1:10332

- **Testnet Cli RPC**

http://127.0.0.1:20332

- **Private net CLI RPC**

  * http://127.0.0.1:10332
  * http://127.0.0.1:20332
  * http://127.0.0.1:30332

  * http://127.0.0.1:40332

- **Private net CLI P2P**
  - http://127.0.0.1:10333
  - http://127.0.0.1:20333
  - http://127.0.0.1:30333
  -  http://127.0.0.1:40333

## Other
[Construct PrivateNet](https://github.com/NewEconoLab/Docs/blob/master/study/DevOps/DockerNeoPrivatenet.md)
