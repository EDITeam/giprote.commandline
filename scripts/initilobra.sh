#!/bin/bash
# Initilobra,means [InitialLocalBranches]'s abbreviation.
# Programmer:Harold.Duan
# Date:20200103
# Reason:[Initilobra] Auto create local [dev] and [debug] branches.

sh $(cd $(dirname $0); pwd -P)/copyright.sh "copyright"
echo \ '
###################################################################
# Initilobra                                                      #
# Init repo,auto create local [dev] and [debug] branches.         #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
echo "Checking repo..."
echo "Checking the branch [dev]..."
branch_dev=$(git branch | grep "dev")
# echo "$branch_dev"
if [ -n "$branch_dev" ]; then
    echo "Branch [dev] is exits!"
else
    echo "Checkout a new local branch [dev]..."
    git checkout -b dev origin/dev
    git push --set-upstream origin dev
fi

echo "Checking the branch [debug]..."
branch_debug=$(git branch | grep "debug")
# echo "$branch_debug"
if [ -n "$branch_debug" ]; then
    echo "Branch [debug] is exits!"
else
    echo "Checkout a new local branch [debug]..."
    git checkout -b debug origin/debug
    git push --set-upstream origin debug
fi

echo "Checkout the local branch [dev]..."
git checkout dev