#!/bin/sh

if [ -z "$OSM_URL" ]; then
  OSM_URL='https://download.geofabrik.de/europe/netherlands-latest.osm.pbf'
fi

if [ -z "${JAVA_OPTS}" ]; then
    JAVA_OPTS="$JAVA_OPTS -Xms128m -Xmx2G -Djava.net.preferIPv4Stack=true"
    JAVA_OPTS="$JAVA_OPTS -server -Djava.awt.headless=true -Xconcurrentio"
    echo "Setting default JAVA_OPTS"
fi

RUN_ARGS=" -jar $HOME/*.jar server config=$HOME/config.properties $OSM_FILE"

echo "JAVA_OPTS= ${JAVA_OPTS}"
echo "RUN_ARGS= ${RUN_ARGS}"

wget --progress=bar:force:noscroll -P data/ $OSM_URL
java -jar *.jar server config.yaml
