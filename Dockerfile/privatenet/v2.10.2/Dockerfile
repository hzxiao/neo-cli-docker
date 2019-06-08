FROM centos

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc \
	&& sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl= https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo' \
	&& yum -y install libunwind libicu \
	&& yum -y install dotnet-sdk-2.2

RUN yum -y install epel-release \
	&& yum -y install leveldb-devel \
	&& yum -y install  git \
	&& yum -y install expect

RUN cd /home/ \
	&& git clone https://github.com/neo-project/neo-cli.git \
	&& cd neo-cli \
	&& git checkout -f  tags/v2.10.2 \
	&& dotnet restore \
	&& dotnet publish -c Release \
	&& cp -r /home/neo-cli/neo-cli/bin/Release/netcoreapp2.1/publish/ /home/cli/

RUN cd /home/cli/ \
	&& rm -f config.json \
	&& cp config.testnet.json config.json \
	&& rm -f protocol.json \
	&& cp protocol.testnet.json protocol.json

WORKDIR /home/cli

# Copy config file
ADD wallets /home/cli/wallets
ADD scripts /home/cli/scripts
# ADD plugins /home/cli/Plugins

COPY Dockerfile/privatenet/v2.10.2/config.json /home/cli/config.json
COPY Dockerfile/privatenet/v2.10.2/protocol.json /home/cli/protocol.json