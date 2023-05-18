#!/usr/bin/env bash 

set -e 

SOURCE=geoanalyticscr.azurecr.io
DEST=arctuscr.azurecr.io

IMGTAG=geoanalytics/geoanalytics-eo:0.2.3

az acr import -n $DEST --source $SOURCE/$IMGTAG --image $IMGTAG