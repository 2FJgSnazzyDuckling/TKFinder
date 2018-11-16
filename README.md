# TKFinder

 Script developed to search and count TK count for specific players #
#                Developed by [2.FJg]SnazzyDuckling                  #
Script to search teamkills within the Squad / Post Scriptum server logs
#                           REQUIREMENTS                             #

Windows 7 or Windows 10 (64 bit)

WINDOWS 10 REQUIREMENTS
.NET Framework 4.5 or higher. (Update here https://www.microsoft.com/net/download/dotnet-framework-runtime)

WINDOWS 7 REQUIREMENTS
Powershell 3.0 or higher. (Update here https://www.microsoft.com/en-us/download/details.aspx?id=54616)
.NET Framework 4.5 or higher. (Update here https://www.microsoft.com/net/download/dotnet-framework-runtime)

#                            HOW TO USE                            #

Unzip the files to any place you'd like.

Grab your PostScriptum.log or any of your backup logs from your server and put it with the RUN.bat & TKFinder.ps1 file.
Run the RUN.bat file (preferably as administrator) and select the game for which you wanna search, then enter the username. It has to be the full correct name and length (it's not case sensitive).
The script will take your log file and assemble it into various filter step where it sorts out the garbage leaving you with the TeamkillPass1.txt which contains detailed information
on the teamkiller aswell as a TeamkillTotal.txt file containing the list of all players teamkilled.

The script will tell you how many teamkills was counted by the player. This number isn't 100% correct and varies,
if the player connected over many sessions and server doesn't get restarted very often. But as a backup in Data there will be the entire
breakdown process for you to investigate further.

After every run of the RUN.bat the Data folder is cleared to ensure data is as correct as possible.
A copy of the Data folder contents are taken and pasted in the Backup folder with date and time at every run of the script.

#                         NOTE FROM SNAZZY                         

While this script isn't perfect and I'll keep working on it, I invite anyone interested to help in making a tool that can make
tracking down teamkillers out of game much easier. This script was made during a bored afternoon at work.

But it's something for the server owners who deal with TK'ers but have a hard time proving it. This will do you justice.

P.S if you have any questions, don't hesitate to hit me up on Discord @ SnazzyDuckling#1337

