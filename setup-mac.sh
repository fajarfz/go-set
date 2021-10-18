#!/bin/sh

# example:
# ./setup-mac.sh go

if [ -z "$1" ]
then
    GOWORKSPACE=go
else
    GOWORKSPACE=$1
fi

brew update
brew install golang

echo $GOWORKSPACE
echo "export GOPATH=$HOME/$GOWORKSPACE" >> ~/.zshrc
echo "export GOBIN=$HOME/$GOWORKSPACE/bin" >> ~/.zshrc
source ~/.zshrc

mkdir -p $GOPATH $GOBIN
