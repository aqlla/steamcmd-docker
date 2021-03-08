FROM ubuntu:latest

RUN apt-get -y update && \
    apt-get -y install lib32gcc1 lib32stdc++6 curl && \
    apt-get clean

RUN useradd -m steam
WORKDIR /home/steam
USER steam

# download steamcmd
#TODO: maybe just get 64-bit version from apt?
RUN mkdir steamcmd && cd steamcmd && \
    curl "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# start steamcmd to get updates
RUN ./steamcmd/steamcmd.sh +quit
RUN mkdir -pv /home/steam/.steam/sdk32/
RUN ln -s /home/steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

# start server from provided script
ENTRYPOINT ["bash", "/home/steam/server.sh"]
