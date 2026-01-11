#!/bin/bash

podman run --rm -it \
  --userns=keep-id \
  --gpus=all \
  --security-opt label=disable \
  -e XDG_RUNTIME_DIR=/run/user/$(id -u) \
  -e PULSE_SERVER=unix:/run/user/$(id -u)/pulse/native \
  -v /run/user/$(id -u):/run/user/$(id -u) \
  whisper-pipewire

