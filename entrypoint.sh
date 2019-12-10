#!/bin/sh

set -e
set -x

hugo env

ls -al

ls -al /github/workspace/

mkdir -p /github/workspace/public/

chmod -R 777 /github/workspace/public/

ls -la

ls -la /github/workspace/public/

hugo && hugo deploy --invalidateCDN --maxDeletes -1

ls -la /github/workspace/public/

exit 0
