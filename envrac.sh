#!/bin/ksh
#PACAKGE_LIST=$( cat /root/list-todo.txt)
PACAKGE_LIST="converters/dos2unix"
PREFIX="/usr/pkgsrc"
BUILD_LOG_FILE_NAME=build.log
STATUS_FILE_NAME=status.txt
REPORT_FILE_NAME=report.txt
WORKDIR=/root
for PACKAGE in $PACAKGE_LIST
do
        #file $PREFIX/$PACKAGE
        cd $PREFIX/$PACKAGE
        make package >> $BUILD_LOG_FILE_NAME
        # I assume if the last line of the build log is "Creating binary package" then the build was a succes
        if grep "Creating binary package" $BUILD_LOG_FILE_NAME
        then
                echo "$PACKAGE BUILD SUCESSFULLY" >> $WORKDIR/$STATUS_FILE_NAME         
        else
                echo "$PACKAGE BUILD FAILED" >> $WORKDIR/$STATUS_FILE_NAME
        fi
done
