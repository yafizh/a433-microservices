#!/bin/bash

# Build Docker image dari Dockerfile di direktori saat ini dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# Tampilkan daftar Docker image yang ada di lokal
docker images

# Ubah nama image agar sesuai dengan format GitHub Packages (ghcr.io/<username>/<image>:<tag>)
docker tag item-app:v1 ghcr.io/yafizh/item-app:v1

# Login ke GitHub Packages menggunakan Personal Access Token yang disimpan di environment variable PASSWORD_GHCR
echo $PASSWORD_GHCR | docker login ghcr.io -u yafizh --password-stdin

# Unggah image ke GitHub Packages
docker push ghcr.io/yafizh/item-app:v1
