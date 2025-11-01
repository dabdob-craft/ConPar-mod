#!/usr/bin/env sh
if [ -f "gradlew.bat" ]; then
  ./gradlew.bat "$@"
else
  java -jar "${GRADLE_USER_HOME}/wrapper/dists/gradle-7.6-bin/6sy5s7g6b7t9o2d1m4w5w7x7i/gradle-7.6/lib/gradle-launcher-7.6.jar" "$@"
fi
