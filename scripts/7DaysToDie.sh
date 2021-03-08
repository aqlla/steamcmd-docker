#!/bin/bash

# install 7 Days to Die
/home/steam/steamcmd/steamcmd.sh \
	+login anonymous \
	+force_install_dir /home/steam/server \
	+app_update 294420 \
	+quit

# run 7 days server
/home/steam/server/7DaysToDieServer.x86_64 \
	-configfile=/home/steam/server/serverconfig.xml \
	-logfile /home/steam/server/output_`date +%Y-%m-%d__%H-%M-%S`.log \
	-quit -batchmode -nographics -dedicated $@

