#!/bin/sh

################################################################################
##  Excel Embedded Flash Games/Macro Search Script  ############################
################################################################################
#                                                                              #
# Purpose:  Generally, since Flash games start with the characters "FWS" even  #
# if they are within an Excel file, simple shell commands tied together to     #
# open every Excel file and go line by line looking for "FWS" will find any    #
# embedded flash. While at it, this will also look for "Sub" in files to find  #
# files with macros. This will identify many false positives but most can be   #
# easily identified as legitimate by the file name.                            #
#                                                                              #
# This is a very crude way to find macros and Flash but was written for use    #
# while working as an ISSM in an environment where approving new scripts and   #
# software takes time. It was written to just be directly typed in and later   #
# adapted in case anybody else could find it useful. Since it was written for  #
# USG use and is very simple, I have released it via CC0 to the Public Domain. #
#                                                                              #
# Usage: Any user can use this by running directly (i.e. ./script or "script"  #
# on Windows) or as an arguement (i.e. /bin/sh script).                        #
#                                                                              #
# Default locations searched are / or P:\ and the log is saved by default in   #
# the current user's Desktop (assumes a graphical environment).                #
#                                                                              #
# Caveats: The user won't be able to search files that they don't have read    #
# access on.                                                                   #
#                                                                              #
# Script Location:                                                             #
# https://github.com/junovitch/info-sec                                        #
# https://mysites.eim.acc.af.mil/personal/jason_unovitch/Shared%20Documents    #
#                                                                              #
################################################################################
#                                                                              #
# Written in 2012 by Jason Unovitch                                            #
# oneshotuno@yahoo.com, jason.unovitch@us.af.mil                               #
#                                                                              #
# To the extent possible under law, the author(s) have dedicated all copyright #
# and related and neighboring rights to this software to the public domain     #
# worldwide. This software is distributed without any warranty.                #
#                                                                              #
# You should have received a copy of the CC0 Public Domain Dedication along    #
# with this software.                                                          #
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>              #
#                                                                              #
################################################################################

export SEARCHWHERE="/"
export LOGFILE="$HOME/Desktop/flashlog.txt"
export WHAT=".*\.\(xls\|ppt\|doc\)"
export TERMS="FWS\|Sub"

echo "Embedded games scan started by $USER on $(date) for $SEARCHWHERE" > "$LOGFILE"
find "$SEARCHWHERE" -regex "$WHAT" -print0 | xargs -0 grep -e "$TERMS" >> "$LOGFILE"
