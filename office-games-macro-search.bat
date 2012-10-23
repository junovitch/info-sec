@echo off

rem ################################################################################
rem ##  Excel Embedded Flash Games/Macro Search Script  ############################
rem ################################################################################
rem #                                                                              #
rem # Purpose:  Generally, since Flash games start with the characters "FWS" even  #
rem # if they are within an Excel file, simple shell commands tied together to     #
rem # open every Excel file and go line by line looking for "FWS" will find any    #
rem # embedded flash. While at it, this will also look for "Sub" in files to find  #
rem # files with macros. This will identify many false positives but most can be   #
rem # easily identified as legitimate by the file name.                            #
rem #                                                                              #
rem # This is a very crude way to find macros and Flash but was written for use    #
rem # while working as an ISSM in an environment where approving new scripts and   #
rem # software takes time. It was written to just be directly typed in and later   #
rem # adapted in case anybody else could find it useful. Since it was written for  #
rem # USG use and is very simple, I have released it via CC0 to the Public Domain. #
rem #                                                                              #
rem # Usage: Any user can use this by running directly (i.e. ./script or "script"  #
rem # on Windows) or as an arguement (i.e. /bin/sh script).                        #
rem #                                                                              #
rem # Default locations searched are / or P:\ and the log is saved by default in   #
rem # the current user's Desktop (assumes a graphical environment).                #
rem #                                                                              #
rem # Caveats: The user won't be able to search files that they don't have read    #
rem # access on.                                                                   #
rem #                                                                              #
rem # Script Location:                                                             #
rem # https://github.com/junovitch/info-sec                                        #
rem # https://mysites.eim.acc.af.mil/personal/jason_unovitch/Shared%20Documents    #
rem #                                                                              #
rem ################################################################################
rem #                                                                              #
rem # Written in 2012 by Jason Unovitch                                            #
rem # oneshotuno@yahoo.com, jason.unovitch@us.af.mil                               #
rem #                                                                              #
rem # To the extent possible under law, the author(s) have dedicated all copyright #
rem # and related and neighboring rights to this software to the public domain     #
rem # worldwide. This software is distributed without any warranty.                #
rem #                                                                              #
rem # You should have received a copy of the CC0 Public Domain Dedication along    #
rem # with this software.                                                          #
rem # If not, see <http://creativecommons.org/publicdomain/zero/1.0/>              #
rem #                                                                              #
rem ################################################################################

set SEARCHWHERE=%USERPROFILE%
set LOGFILE=%USERPROFILE%\Desktop\flashlog.txt
set WHAT=*.xls *.ppt *.doc
set TERMS=FWS CWS \ Sub

@echo on
echo Embedded games scan started by %USERNAME% on %DATE% %TIME% for %SEARCHWHERE% > "%LOGFILE%"
FOR /R %SEARCHWHERE% %%f IN (%WHAT%) DO FINDSTR /R "%TERMS%" "%%f" > NUL && if not errorlevel 1 echo REVIEW: %%f >> "%LOGFILE%"