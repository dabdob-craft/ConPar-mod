#!/usr/bin/env sh
#
# Copyright 2015-2023 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for POSIX systems
##
##############################################################################

# Add default java opts
DEFAULT_JAVA_OPTS="-Xmx64m"

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
mingw=false
case "`uname`" in
  CYGWIN*)
    cygwin=true
    ;;
  Darwin*)
    darwin=true
    ;;
  MINGW*)
    mingw=true
    ;;
esac

# Determine the Java command to run.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # Found in JAVA_HOME/jre, for Solaris
        JAVACMD="$JAVA_HOME/jre/sh/java"
    fi
    if [ -x "$JAVA_HOME/bin/java" ] ; then
        JAVACMD="$JAVA_HOME/bin/java"
    fi
fi
if [ -z "$JAVACMD" ] ; then
    JAVACMD="java"
fi

# Determine the location of the Gradle distribution.
if [ -n "$GRADLE_HOME" ] ; then
    if [ -x "$GRADLE_HOME/bin/gradle" ] ; then
        GRADLE_HOME="$GRADLE_HOME"
    fi
elif [ -x "`dirname "$0"`/gradle" ] ; then
    GRADLE_HOME="`dirname "$0"`/gradle"
elif [ -x "`dirname "$0"`/gradle/wrapper/gradle-wrapper.jar" ] ; then
    # GRADLE_HOME is not set, we assume we are running from a wrapper
    # we don't need to set GRADLE_HOME here
    true
else
    # GRADLE_HOME is not set and we are not running from a wrapper.
    # Set GRADLE_HOME to the installation directory.
    if [ -x "`dirname "$0"`/bin/gradle" ] ; then
        GRADLE_HOME="`dirname "$0"`"
    fi
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME="`cygpath --unix "$JAVA_HOME"`"
    [ -n "$CLASSPATH" ] && CLASSPATH="`cygpath --path --unix "$CLASSPATH"`"
    [ -n "$GRADLE_HOME" ] && GRADLE_HOME="`cygpath --unix "$GRADLE_HOME"`"
fi

# Set the classpath.
GRADLE_CLASSPATH=""
if [ -n "$CLASSPATH" ] ; then
    GRADLE_CLASSPATH="$CLASSPATH"
fi

# Add the wrapper jar to the classpath.
if [ -f "`dirname "$0"`/gradle/wrapper/gradle-wrapper.jar" ] ; then
    GRADLE_CLASSPATH="$GRADLE_CLASSPATH:`dirname "$0"`/gradle/wrapper/gradle-wrapper.jar"
fi

# Add the wrapper jar to the classpath.
if [ -f "$GRADLE_HOME/lib/gradle-wrapper.jar" ] ; then
    GRADLE_CLASSPATH="$GRADLE_CLASSPATH:$GRADLE_HOME/lib/gradle-wrapper.jar"
fi

# Add the wrapper jar to the classpath.
if [ -f "$GRADLE_HOME/wrapper/gradle-wrapper.jar" ] ; then
    GRADLE_CLASSPATH="$GRADLE_CLASSPATH:$GRADLE_HOME/wrapper/gradle-wrapper.jar"
fi

# For Cygwin, switch paths to Windows format before running java.
if $cygwin || $mingw ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME="`cygpath --windows "$JAVA_HOME"`"
    [ -n "$CLASSPATH" ] && CLASSPATH="`cygpath --path --windows "$CLASSPATH"`"
    [ -n "$GRADLE_HOME" ] && GRADLE_HOME="`cygpath --windows "$GRADLE_HOME"`"
fi

# Execute Gradle.
if [ -n "$GRADLE_HOME" ] ; then
    # We are running from an installation directory.
    # Execute the 'gradle' script in the installation directory.
    exec "`dirname "$0"`/bin/gradle" "$@"
else
    # We assume we are running from a wrapper.
    # Set the classpath to the wrapper jar.
    exec "$JAVACMD" $DEFAULT_JAVA_OPTS -classpath "$GRADLE_CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
fi
