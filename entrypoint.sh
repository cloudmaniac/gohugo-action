#!/bin/sh

set -e
set -x

hugo env

ls

pwd

ls -la

hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
