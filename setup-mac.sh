#!/bin/sh

# example:
# ./setup-mac.sh go

if [ -z "$1" ]
then
    GOWORKSPACE=go
else
    GOWORKSPACE=$1
fi

# install latest golang
brew update
brew install golang
go version

# setup environment variable
echo $GOWORKSPACE
echo "export GOPATH=$HOME/$GOWORKSPACE" >> ~/.zshrc
echo "export GOBIN=$HOME/$GOWORKSPACE/bin" >> ~/.zshrc
source ~/.zshrc

## setup golang workspace
mkdir -p $GOPATH $GOBIN $GOPATH/src

## init simple hello project
cd $GOPATH/src && mkdir hello && cd hello
go mod init hello
echo 'package main\nimport "fmt"\nfunc main() {\nfmt.Println("Hello, World!")\n}' >> main.go
go run .
