#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then 
       echo "Use this script up the jupyter notebook for pyspark and others"
       exit 1
fi

check_env=$(env | grep VIRTUAL_ENV | grep -v grep)

if [ ! -n "${check_env}" ] ; then 
       echo "Setting virtualEnv for PySpark"
       source /home/ubuntu/pyspark/spark/bin/activate
else
 	echo "Already IN Virtual Env"
fi	

ps_status=$(ps -ef | grep 'jupyter' | grep -v grep)

if [ ! -n "$ps_status" ] ; then 
	echo "Bringing up the jupyter notebook....."
	/home/ubuntu/pyspark/spark/bin/jupyter notebook
	if [ $? -eq 0 ] ; then echo "Jupyter been brought up...!!!!!" ; fi 
else
	echo "Already Jupyter up and running"
fi 
