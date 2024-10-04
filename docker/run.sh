#!/usr/bin/env bash

if ! command -v protoc &> /dev/null
then
    echo "protoc must be installed to run this script"
    exit 1
fi

protoc \
  --descriptor_set_out wiremock-data/grpc/services.dsc \
  --proto_path proto_files \
  proto_files/wallet/myservice.proto

docker run -it --rm \
  -p 8080:8080 \
  --name wiremock \
  -v $PWD/wiremock-data:/home/wiremock \
  -v $PWD/extensions:/var/wiremock/extensions \
  wiremock/wiremock:3.9.1

# Try to curl with
