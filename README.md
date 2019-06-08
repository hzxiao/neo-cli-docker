# neo-cli-docker
use neo-cli easy by docker

## Setp 1

Prepare docker environment

https://docs.docker.com/engine/installation/

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
sudo yum install docker-ce

## Setp 2

Run Shell to Buld Image 

For Mainnet

<code>
docker build -t neo-cli:v0.1 https://github.com/NewEconoLab/neo-cli-docker.git#:dockerfile/mainnet
</code>


For Testnet

<code>
docker build -t neo-cli-testnet:v0.1 https://github.com/NewEconoLab/neo-cli-docker.git#:dockerfile/testnet
</code>

## Step 3

Run Shell to Run container From Image

For Mainnet

<code>
docker run --rm -it -p 10332:10332 -v /home/neo/cli/0:/home/cli/Chain neo-cli:v0.1 /bin/bash
</code>

For Testnet

<code>
docker run --rm -it -p 20332:20332 -v /home/neo/cli/0:/home/cli/Chain neo-cli-testnet:v0.1 /bin/bash
</code>

## Step 4

Start neo-cli

<code>
cd /home/cli && dotnet neo-cli.dll /rpc
</code>

[Ctrl]+[p]+[q] to exit container with not stop

## Step 5

Mainnet Cli RPC

http://127.0.0.1:10332

Testnet Cli RPC

http://127.0.0.1:20332

for Private net

## Setp 1

Run Shell to Buld Image

```shell
git clone https://github.com/hzxiao/neo-cli-docker.git

cd neo-cli-docker

docker build -t neo-cli-prinet:v2.10.2 -f Dockerfile/privatenet/v2.10.2/Dockerfile .
```

## Setp 2

Run Shell to Start neo-cli

```shell
cd Dockerfile/privatenet/v2.10.2/

docker-compose up -d
```

## Step 3

Private net CLI RPC

*. http://127.0.0.1:10332
*. http://127.0.0.1:20332
*. http://127.0.0.1:30332
*. http://127.0.0.1:40332

Private net CLI P@P

*. http://127.0.0.1:10333
*. http://127.0.0.1:20333
*. http://127.0.0.1:30333
*. http://127.0.0.1:40333

## Setp X
[Construct PrivateNet](https://github.com/NewEconoLab/Docs/blob/master/study/DevOps/DockerNeoPrivatenet.md)
