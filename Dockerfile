FROM kriansa/cs-16:latest

# Runtime settings
ENV MAXPLAYERS="24"
ENV MAPNAME="de_dust2"

# Copy the files
COPY --chown=steam:steam cstrike/addons cstrike/addons
COPY --chown=steam:steam cstrike/cfgs cstrike/cfgs
COPY --chown=steam:steam cstrike/liblist.gam cstrike/mapcycle.txt \
  cstrike/*.cfg cstrike/motd.html cstrike/

# Copy the maps/textures/etc.
COPY --chown=steam:steam cstrike/maps/* cstrike/maps/
COPY --chown=steam:steam cstrike/gfx/* cstrike/gfx/
COPY --chown=steam:steam cstrike/*.wad cstrike/
COPY --chown=steam:steam cstrike/models/* cstrike/models/
COPY --chown=steam:steam cstrike/sound/* cstrike/sound/
COPY --chown=steam:steam cstrike/sprites/* cstrike/sprites/

CMD /home/steam/hlds/hlds_run -game cstrike +ip 0.0.0.0 +maxplayers $MAXPLAYERS +map $MAPNAME
