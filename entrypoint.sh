#!/bin/sh

ls -la
ls -la public/

sh -c "hugo $*"

sh -c "hugo"

sh -c "hugo env"

sh -c "hugo -v"

ls -la public/posts/
