#!/bin/sh

set -e

echo 'removing node_modules '
sudo rm -rf ./node_modules

echo 'changing file ownership'
sudo chown -R dev:dev .

echo 'changing file permissions'
find . \( -type d -o -type f \) -exec sudo -u dev chmod g+w {} \;

echo 'changing default file acl'
sudo -u dev setfacl -Rm d:g:dev:rw .

echo 'marking safe git repository'
git config --global safe.directory "$(pwd)"

echo 'installing node_modules'
if [ -f package-lock.json ]; then
  sudo -u dev npm ci
elif [ -f package.json ]; then
  sudo -u dev npm install
fi
