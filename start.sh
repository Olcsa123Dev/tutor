#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

PORT=${PORT:-10000}

echo "--- TERMINAL ---"
echo "online"
echo "---------------------------"

ttyd -p $PORT bash
