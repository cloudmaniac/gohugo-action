#!/bin/sh

set -e
set -x

hugo env


ls -al /github/workspace/

ls -la /github/workspace/themes/

echo $CLOUDFRONT_DISTRIBUTION_ID

hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
