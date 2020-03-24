#!/bin/sh

set -e
set -x

echo "Checking Hugo version:"
hugo env

echo "Validating repository that has been checked out:"
ls -al /github/workspace/

echo "Validating themes folder (usually a git submodules)"
ls -la /github/workspace/themes/

echo "Build website and deploy"
hugo && hugo deploy --invalidateCDN --maxDeletes -1

exit 0
