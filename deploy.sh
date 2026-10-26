#!/bin/sh
# Keep the server alive after the Jenkins build finishes
export JENKINS_NODE_COOKIE=dontKillMe
export BUILD_ID=dontKillMe

# Stop any previous server
if [ -f .server.pid ]; then kill "$(cat .server.pid)" 2>/dev/null || true; fi

setsid nohup npx http-server src -p 8081 -s > server.log 2>&1 &
echo $! > .server.pid
sleep 3
echo "Deployed to http://localhost:8081"
