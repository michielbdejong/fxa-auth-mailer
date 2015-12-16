FROM vladikoff/fxa-slim-image:latest

MAINTAINER michielbdejong <michiel@mozilla.com>

RUN adduser --disabled-password --gecos '' fxa && adduser fxa sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /home/fxa/fxa-content-server
WORKDIR /home/fxa/fxa-content-server
RUN chown -R fxa .
USER fxa

RUN npm i --production
RUN npm cache clear

CMD npm start

# Expose ports
EXPOSE 3306
