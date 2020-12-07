FROM openjdk:8-jre

ARG OSM_URL
ENV OSM_URL=${OSM_URL}

ENV HOME /home/graphhopper

ENV GRAPHHOPPER_URL https://graphhopper.com/public/releases/graphhopper-web-2.2.jar

RUN wget --progress=bar:force:noscroll $GRAPHHOPPER_URL -P $HOME/

ADD scripts $HOME
ADD config.yaml $HOME/

EXPOSE 8989

WORKDIR $HOME

ENTRYPOINT ["./start.sh"]
