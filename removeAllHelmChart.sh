#!/bin/sh
helm uninstall consumer
helm uninstall producer
helm uninstall rabbitmq
helm uninstall vault