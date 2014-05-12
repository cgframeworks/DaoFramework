#!/bin/bash

# Check if the JAVA_HOME is valid.
if [ ! -f "$JAVA_HOME/bin/java" ]; then 

    echo ERROR ------------------------------------------------------------
    echo ERROR ------------------------------------------------------------
    echo ERROR - There does not appear to be a valid Java installation at 
    echo ERROR - the assumed location of the JAVA_HOME. Please check your 
    echo ERROR - installation and/or environment settings.
    echo ERROR ------------------------------------------------------------
    echo ERROR ------------------------------------------------------------
    echo
    exit
fi

 # set path to eclipse folder. If local folder, use '.'; otherwise, use /path/to/eclipse/
 SERVER_HOME=".";

 # get path to equinox jar inside $SERVER_HOME folder
 cp=$(find $SERVER_HOME -name "org.eclipse.equinox.launcher_*.jar" | sort | tail -1);

 # start Eclipse w/ java
 $JAVA_HOME/bin/java -cp $cp -Dautoload.enable=true org.eclipse.equinox.launcher.Main "$@"
