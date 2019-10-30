#!/bin/sh

ls -la
ls -la public/

sh -c "hugo $*"

sh -c "hugo env"

sh -c "hugo -v"

pwd

ls -la /github/workspace/public/

ls -la /github/workspace/public/posts/

ls -la public/posts/
