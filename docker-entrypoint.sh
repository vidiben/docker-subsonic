#!/bin/sh

SUBSONIC_MAX_MEMORY=${SUBSONIC_MAX_MEMORY:-512}
export CATALINA_OPTS="-Xmx512m"

exec sh catalina.sh run