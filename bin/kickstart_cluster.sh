#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: `basename $0` <cluster name> <cluster num> [branch name]"
    exit 1
fi

CLUSTER_NAME=$1
CLUSTER_NUM=$2
BRANCH_NAME=$3

if [ "$CLUSTER_NAME" == "" ]; then
    CLUSTER_NAME="peters_opsc"
fi

echo "Launching Cluster"
ctool launch $CLUSTER_NAME $CLUSTER_NUM

echo "Installing DSE"
ctool install -s 1 -y 0 -e 0 $CLUSTER_NAME enterprise

echo "Installing Opscenter"
if [ "$1" == "" ]; then
    ctool install $CLUSTER_NAME opscenter
else
    ctool install $CLUSTER_NAME -b $BRANCH_NAME opscenter
fi

echo "Starting services"
printf '{"operation":"build_agent_packages", "script":"build-agent-packages.sh"}' | ctool module $CLUSTER_NAME 0 opscenter.py
ctool start $CLUSTER_NAME enterprise
ctool start $CLUSTER_NAME opscenter
ctool info $CLUSTER_NAME

notify "Setup is done"
