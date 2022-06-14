#!/bin/bash

use_docker="true"
export LOGGING_LEVEL_COM_QUORUM_GAUGE="info"
sh cleanup.sh
export HEARTBEAT_INTERVAL=""

rm -rf TEST-LOOP-FAILED-*
rm -rf out.txt

for COUNTER in $(seq 1 1)
do
  echo >> out.txt
  echo >> out.txt
  echo >> out.txt
  echo >> out.txt
  echo >> out.txt
  echo >> out.txt
  date >> out.txt
  date
  echo "run count $COUNTER" >> out.txt
  echo "run count $COUNTER"
  declare -a t=( "privacy-enhancements-upgrade || networks/template::istanbul-4nodes-pe" )
  for tags in "${t[@]}";
  do
    echo $tags
    pe="true"
    if [ "$use_docker" == "true" ];
    then
      docker run --rm --network host -e TF_VAR_privacy_enhancements="{block=0, enabled=$pe}" -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/acctests:/tmp/acctests quorumengineering/acctests:develop test -Pauto -Dtags="$tags" -Dauto.outputDir=/tmp/acctests -Dnetwork.forceDestroy=true >> out.txt
    else
      export TF_VAR_privacy_enhancements="{block=0, enabled=$pe}"
      mvn clean test -Pauto -Dtags="$tags" >> out.txt
    fi
    #if [ $? -eq 0 ]
    #then
    #  echo "Success: $COUNTER"
    #else
    #  echo "Failure: $COUNTER"
    #  echo "Failure Info:" >> out.txt
      docker ps -a >> out.txt
      mkdir "TEST-LOOP-FAILED-$COUNTER"
      for containerId in $(docker ps -qa)
      do
          echo "container: $containerId" >> out.txt
          containerName=$(docker container inspect -f='{{ .Name}}' $containerId)
          containerOut="TEST-LOOP-FAILED-${COUNTER}${containerName}.log"
          echo "containerOutputFile: $containerOut" >> out.txt
          docker container inspect $containerId >> $containerOut
          docker container logs $containerId >> $containerOut 2>&1
      done
      exit 1
    #fi
    sleep 2s
    cleanup.sh >> out.txt 2>&1
  done
done
