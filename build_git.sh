#!/bin/bash
#
# Copyright(c) 2017-2100.  jielong.lin@qq.com.    All rights reserved.
#
# Use it to build a git repository then bind to a remote git repository with url ($1)
# For windows, suggest to run it in git-bash.exe.
#

if [ x"$1" = x"help" ]; then
cat >&1<<EOF

Usage:
  (1). Copy it to the root path in Your Project because it is run over the current path.
  (2). Run it as follows:
         $0 git@172.20.30.29:MyProjectPath_in_ServerIP(172.20.30.29)

       such as:
	 $0 git@172.20.30.29:~/FW5_Demo_v3.3

EOF
    exit 0
fi

#exit 0 # please do it after build git repository successfully.
if [ x"$1" = x ]; then
    echo
    echo "Exit-0: please type the legal USERNAME@URL:PROJECT_PATH, such as:"
    echo "        git@172.20.30.29:~/project_test"
    echo
    echo "Referece to Useage Details as follow:"
    echo "  $0 help"
    echo
    exit 0
fi

_my_URL=$1
_my_Project=${_my_URL##*:}
_my_URL=${_my_URL%%:*}
echo
echo "JLL-Probing: check if ${_my_Project} is valid or not..."
ssh ${_my_URL} "ls ${_my_Project} 2>/dev/null"
echo
if [ x"$?" != x"0" ]; then
    echo
    echo "Exit-1: please type the legal USERNAME@URL:PROJECT_PATH, such as:"
    echo "        git@172.20.30.29:~/project_test"
    echo
    echo "Referece to Useage Details as follow:"
    echo "  $0 help"
    echo
    exit 0
fi

_my_DT="$(date +%Y-%m-%d\ %H:%M)"

if [ x"$(ls -l .gitignore 2>/dev/null)" = x ]; then
    echo "desktop.ini" > .gitignore
    echo "${0##*/}"   >> .gitignore
    read -p "JLL: Modify .gitignore for ignoring some files if press [y], or skip:   " -n 1 _my
    if [ x"${_my}" = x"y" ]; then
        vim .gitignore
    fi
fi

if [ x"$(ls -l .git 2>/dev/null)" = x ]; then
    echo "git init"
    git init
fi

if [ x"$(git status -s)" != x ]; then
    echo "git add -A"
    git add -A
    echo "git commit -m \"create the new project @ ${_my_DT}\""
    git commit -m \
"create the new project ${_my_Project} @ ${_my_DT}
    bind to ${_my_URL}:${_my_Project}
"

fi

if [ x"$(git remote -v)" = x ]; then
    echo "git remote add origin $1"
    git remote add origin $1
fi
echo "#git push origin master"
# git push origin master

