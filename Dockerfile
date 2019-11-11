FROM alpine:3.10

LABEL com.benoitvidis.vendor="Benoît Vidis"

ENV SUBSONIC_VERSION=6.1.6
ENV SUBSONIC_DEFAULT_MUSIC_FOLDER=/var/subsonic/music
ENV SUBSONIC_DEFAULT_PODCAST_FOLDER=/var/subsonic/podcast
ENV SUBSONIC_DEFAULT_PLAYLIST_FOLDER=/var/subsonic/playlists

LABEL version="$SUBSONIC_VERSION"
LABEL description="Subsonic media streamer v$SUBSONIC_VERSION"

RUN  set -x \
  && apk add --no-cache \
    curl \
    ffmpeg \
    lame \
    openjdk8-jre \
    tomcat-native \
    unzip \
  \
  && curl -o tomcat.tar.gz -SLO https://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz \
  && tar xzf tomcat.tar.gz \
  && mv apache-tomcat-* /usr/local/tomcat \
  && rm tomcat.tar.gz \
  && echo 'export spring_config_additional_location=/usr/local/tomcat/conf/application.properties' >> /usr/local/tomcat/bin/setenv.sh \
  && echo 'server.use-forward-headers=true' >> /usr/local/tomcat/conf/application.properties \
  \
  && mkdir -p \
		"${SUBSONIC_DEFAULT_MUSIC_FOLDER}" \
		"${SUBSONIC_DEFAULT_PODCAST_FOLDER}" \
		"${SUBSONIC_DEFAULT_PLAYLIST_FOLDER}" \
  && curl -o subsonic.war.zip -SLO https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-${SUBSONIC_VERSION}-war.zip \
  && unzip subsonic.war.zip \
  && rm -rf /usr/local/tomcat/webapps/ROOT \
  && mv subsonic.war /usr/local/tomcat/webapps/ROOT.war \
  \
  && apk del --no-cache \
    curl \
    unzip \
  \
  && echo done

WORKDIR /usr/local/tomcat/bin

COPY docker-entrypoint.sh /

CMD ["/docker-entrypoint.sh"]

