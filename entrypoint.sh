#!/bin/sh

set -e
set -x

hugo env

hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
