#!/bin/bash
# Initilobra,means [InitialLocalBranches]'s abbreviation.
# Programmer:Harold.Duan
# Date:20200103
# Reason:[Initilobra] Auto create local [dev] and [debug] branches.

.$env:giprote_dir\scripts\copyright.ps1 "copyright"
Write-Output '
###################################################################
# Initilobra                                                      #
# Init repo,auto create local [dev] and [debug] branches.         #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
Write-Output "Checking repo..."
Write-Output "Checking the branch [dev]..."
$branch_dev=$(git branch | findstr "dev")
# echo "$branch_dev"
if ($branch_dev) {
    Write-Output "Branch [dev] is exits!"
}
else {
    Write-Output "Checkout a new local branch [dev]..."
    git checkout -b dev origin/dev
    git push --set-upstream origin dev
}

Write-Output "Checking the branch [debug]..."
$branch_debug=$(git branch | findstr "debug")
# echo "$branch_debug"
if ($branch_debug) {
    Write-Output "Branch [debug] is exits!"
}
else
{
    Write-Output "Checkout a new local branch [debug]..."
    git checkout -b debug origin/debug
    git push --set-upstream origin debug
}

Write-Output "Checkout the local branch [dev]..."
git checkout dev