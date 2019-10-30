#!/bin/sh

set -e
set -x

echo $GITHUB_WORKSPACE
echo $GITHUB_REPOSITORY

root_path="$GITHUB_WORKSPACE"
echo "Root path is: ${root_path}"
blog_path="$GITHUB_WORKSPACE/public/"
echo "Blog path is: ${blog_path}"
mkdir -p "$blog_path"
mkdir -p "$root_path"

touch public/test.html

cd "$root_path"
echo "Preparing to build blog"
hugo
echo "Building is done. Copying over generated files"
#cp -R public/* "$blog_path"/
echo "Copy is done...or not..."

hugo deploy --dryRun

hugo deploy

exit 0
