#!/bin/bash

golangci-lint run
gofumpt -l -w .