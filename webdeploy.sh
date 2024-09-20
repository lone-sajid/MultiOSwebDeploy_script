#!/bin/bash

USR="devops"

for host in `cat /tmp/remhosts`
do
  echo
  echo "===================================="
  echo "Deployment for host $host"
  echo "Pushing script to host $host"
  scp /tmp/webscript.sh $USR@$host:/tmp/
  echo "Executing script of $host"
  ssh $USR@$host /tmp/webscript.sh
  echo "Completed for $host"
done
