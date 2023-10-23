#!/bin/sh
sh install.sh
sh imageDownload.sh
#sh minikubeImageLoad.sh
sleep 10s
sh runHelmChart.sh