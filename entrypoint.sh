#!/bin/sh

ls -la
ls -la public/
ls -la public/posts/

sh -c "hugo $*"

ls -la public/posts/
