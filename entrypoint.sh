#!/bin/sh

set -e
set -x

hugo env

hugo deploy

exit 0
