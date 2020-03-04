#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then 
       echo "Use this script up the jupyter notebook for pyspark and others"
       exit 1
fi

ps_status=$(ps -ef | grep 'jupyter' | grep -v grep)

if [ ! -n "$ps_status" ] ; then 
	echo "Bringing up the jupyter notebook....."
	/home/ubuntu/pyspark/spark/bin/jupyter notebook
	if [ $? -eq 0 ] ; then echo "Jupyter been brought up...!!!!!" ; fi 
else
	echo "Already Jupyter up and running"
fi 
