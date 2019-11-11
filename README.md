# docker-subsonic

An Alpine-based subsonic installation.

```
docker run -d -p 8080:8080 \
	-v ~/Music:/var/subsonic/music
```

## Default folders & related environment variables

* `SUBSONIC_MAX_MEMORY=512`
Maximum java heap space size in megabytes.
