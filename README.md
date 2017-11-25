# docker-subsonic

An Alpine-based subsonic installation.

```
docker run -d -p 4040:4040 \
	-v ~/Music:/var/subsonic/music
  -v ~/.config/subsonic:/var/subsonic/data
```

## Default folders & related environment variables

This container uses slightly different default folders than a default standard subsonic installation.

* `SUBSONIC_ROOT=/opt/subsonic`
Default installation path.

* `SUBSONIC_HOME=/var/subsonic/data`
Local configuration location.

* `SUBSONIC_HOST=0.0.0.0`
Default host binding (related to the container).

* `SUBSONIC_PORT=4040`
Default subsonic network port.

* `SUBSONIC_MAX_MEMORY=512`
Maximum java heap space size in megabytes.

* `SUBSONIC_DEFAULT_MUSIC_FOLDER=/var/subsonic/music`
Music library default location.

* `SUBSONIC_DEFAULT_PODCAST_FOLDER=/var/subsonic/podcast`
* `SUBSONIC_DEFAULT_PLAYLIST_FOLDER=/var/subsonic/playlists`
