#!/bin/bash
# Initicomit,means [InitialCommit]'s abbreviation.
# Programmer:Harold.Duan
# Date:20200103
# Reason:[Initicomit] Auto create [dev] and [debug] branches.

sh $(cd $(dirname $0); pwd -P)/copyright.sh "copyright"
echo \ '
###################################################################
# Initicomit                                                      #
# Init repo,auto create [dev] and [debug] branches.               #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
echo "Init repo..."
echo "Generate repo's .gitignore..."
sh Genignore.sh
echo "Checking the branch [master]..."
branch_master=$(git branch | grep "master")
# echo "$branch_master"
if [ -n "$branch_master" ]; then
    echo "Branch [master] is exits!"
    git checkout master
else
    echo "Branch [master] is not exists,create branch [master]..."
    git add .
    git commit -m ":tada: Init repo"
    git push --set-upstream origin master

fi

echo "Checking the branch [dev]..."
branch_dev=$(git branch | grep "dev")
# echo "$branch_dev"
if [ -n "$branch_dev" ]; then
    echo "Branch [dev] is exits!"
else
    echo "Checkout a new branch [dev]..."
    git checkout master
    git checkout -b dev
    git push --set-upstream origin dev
fi

echo "Checking the branch [debug]..."
branch_debug=$(git branch | grep "debug")
# echo "$branch_debug"
if [ -n "$branch_debug" ]; then
    echo "Branch [debug] is exits!"
else
    echo "Checkout a new branch [debug]..."
    git checkout master
    git checkout -b debug
    git push --set-upstream origin debug
fi

git checkout master