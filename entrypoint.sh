#!/bin/sh

set -e
set -x

echo "GITHUB_WORKSPACE:"$GITHUB_WORKSPACE
echo "GITHUB_REPOSITORY:"$GITHUB_REPOSITORY

sh -c "hugo env"

sh -c "hugo $*"

sh -c "hugo env"

root_path="$GITHUB_WORKSPACE"
echo "Root path is: ${root_path}"
blog_path="$GITHUB_WORKSPACE/public/"
echo "Blog path is: ${blog_path}"
mkdir -p "$blog_path"
mkdir -p "$root_path"
cd "$root_path"
echo "Preparing to build blog"
hugo
echo "Building is done. Copying over generated files"
cp -R public/* "$blog_path"/
echo "Copy is done."

exit 0
