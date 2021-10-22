#!/bin/bash

cd terraform/
curl "http://$(~/terraform output | grep public_dns | awk '{print $2;exit}')" | sed -e "s/\",//g"
