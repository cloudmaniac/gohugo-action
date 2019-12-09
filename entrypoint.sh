#!/bin/sh

set -e
set -x

hugo env

mkdir -p /github/workspace/public/

hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
