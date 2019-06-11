FROM mcr.microsoft.com/dotnet/core/sdk:2.2

RUN apt-get update && apt-get install -y \
    libleveldb-dev \
    sqlite3 \
    libsqlite3-dev \
    libunwind8-dev \
    expect \
    vim

RUN rm -rf /var/lib/apt/lists/*

RUN cd /home/ \
	&& git clone https://github.com/neo-project/neo-cli.git \
	&& cd neo-cli \
	&& git checkout -f  tags/v2.10.2 \
	&& dotnet restore \
	&& dotnet publish -c Release \
	&& cp -r /home/neo-cli/neo-cli/bin/Release/netcoreapp2.1/publish/ /neo/

WORKDIR /neo

# Copy config file
ADD wallets /neo/wallets
ADD scripts /neo/scripts
ADD Dockerfile/privatenet/v2.10.2/Plugins /neo/Plugins

COPY Dockerfile/privatenet/v2.10.2/config.json /neo/config.json
COPY Dockerfile/privatenet/v2.10.2/protocol.json /neo/protocol.json

RUN mkdir /neo/data