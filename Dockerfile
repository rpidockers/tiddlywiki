FROM resin/rpi-raspbian:jessie

# Update
RUN apt-get update
RUN apt-get upgrade -y

# Install npm
RUN apt-get install -y software-properties-common curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

ENV USER user
ENV PASSWORD ""

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
