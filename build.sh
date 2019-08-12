#!/bin/sh
export GOOS=linux
export GOARCH=amd64
go build -o dwt main.go