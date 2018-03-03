#!/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/root/bin

if [ $# = 0 ]; then
  echo
  echo Usage example:
  echo "./IP2JSON.sh IPs.txt > points.json"
  echo
  exit 1
fi

started=0
iplist=$1

echo "{"
echo "\"type\": \"FeatureCollection\","
echo "\"features\": ["

for IP in `cat $iplist`
do
  if [ $started -eq 1 ]
  then
    echo ","
  fi

  ipcoords=`geoiplookup $IP | grep "Rev 1" | awk '{print $(NF-3)" "$(NF-2)}' | cut -d , -f1,2 | tr -d ' '`
  lat=`echo $ipcoords | cut -d , -f1`
  long=`echo $ipcoords | cut -d , -f2`
  echo "{ \"type\": \"Feature\", \"properties\": { \"Name\": \"IP-Address\", \"Description\": \"$IP\" }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ $long, $lat ] } }"

  if [ $started -eq 0 ]
  then
    started=1
  fi
done

echo "]"
echo "}"
