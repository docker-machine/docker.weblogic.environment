#!/bin/bash
docker rm `docker ps -a | grep weblogic | awk '{print $1}'` -f
docker rmi -f  `docker images | grep 'weblogic' | awk '{print $3}'` 
docker build --build-arg JDK_PKG=jdk-8u271-linux-x64.tar.gz --build-arg WEBLOGIC_JAR=fmw_12.2.1.4.0_wls_lite_generic.jar  -t weblogic122140jdk8u271 .
docker run -d -p 7001:7001 -p 8453:8453 -p 5556:5556 --restart always --name weblogic122140jdk8u271 weblogic122140jdk8u271
# rm -rf ./middleware
# mkdir ./middleware
# docker cp weblogic122140jdk8u271:/u01/app/oracle/middleware/wlserver ./middleware/