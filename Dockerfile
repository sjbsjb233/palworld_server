#Version:0.1.4.0
FROM cm2network/steamcmd
LABEL maintainer="sjbsjb233 <sjbsjb233@foxmail.com>"

USER steam
RUN cd /home/steam/steamcmd

RUN ./steamcmd.sh +login anonymous +app_update 2394010 validate +quit

RUN mkdir -p ~/.steam/sdk64/
RUN ./steamcmd.sh +login anonymous +app_update 1007 +quit
RUN cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

RUN cd ~/Steam/steamapps/common/PalServer

EXPOSE 8211

CMD ["/home/steam/Steam/steamapps/common/PalServer/PalServer.sh"]
