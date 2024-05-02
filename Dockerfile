FROM debian:stable-slim
RUN apt-get update
RUN apt-get install wget libicu-dev build-essential libz-dev -y
RUN mkdir -p /tmp/dotnet
RUN cd /opt
RUN wget https://download.visualstudio.microsoft.com/download/pr/1e449990-2934-47ee-97fb-b78f0e587c98/1c92c33593932f7a86efa5aff18960ed/dotnet-sdk-8.0.204-linux-arm64.tar.gz
RUN tar zxf dotnet-sdk-8.0.204-linux-arm64.tar.gz -C /tmp/dotnet
RUN rm -R dotnet-sdk-8.0.204-linux-arm64.tar.gz
RUN chown -R root:root /tmp/dotnet/
RUN chmod 777 /tmp/dotnet
ENV DOTNET_ROOT=/tmp/dotnet
ENV PATH=$PATH:/tmp/dotnet