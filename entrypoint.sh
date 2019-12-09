#!/bin/sh

set -e
set -x

hugo env

ls -al

ls -al /github/workspace/public/

mkdir -p /github/workspace/public/

ls -al

ls -la /github/workspace/public/

hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
