<#
**** Initicomit,means [InitialCommit]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20200111
**** Reason:[Initicomit] Auto create [dev] and [debug] branches.
#>

.$env:giprote_dir\scripts\copyright.ps1 "copyright"
Write-Output '
###################################################################
# Initicomit                                                      #
# Init repo,auto create [dev] and [debug] branches.               #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
Write-Output "Init repo..."
Write-Output "Generate repo's .gitignore..."
.$env:giprote_dir\scripts\genignore.ps1
Write-Output "Checking the branch [master]..."
$branch_master=$(git branch | Where-Object {$_ -match "master"})
# echo "$branch_master"
if ($branch_master) {
    Write-Output "Branch [master] is exits!"
    git checkout master
}
else {
    Write-Output "Branch [master] is not exists,create branch [master]..."
    git add .
    git commit -m ":tada: Init repo"
    git push --set-upstream origin master
}

Write-Output "Checking the branch [dev]..."
$branch_dev=$(git branch | Where-Object {$_ -match "dev"})
# echo "$branch_dev"
if ($branch_dev) {
    Write-Output "Branch [dev] is exits!"
}
else {
    Write-Output "Checkout a new branch [dev]..."
    git checkout master
    git checkout -b dev
    git push --set-upstream origin dev
}

Write-Output "Checking the branch [debug]..."
$branch_debug=$(git branch | Where-Object {$_ -match "debug"})
# echo "$branch_debug"
if ($branch_debug) {
    Write-Output "Branch [debug] is exits!"
}
else {
    Write-Output "Checkout a new branch [debug]..."
    git checkout master
    git checkout -b debug
    git push --set-upstream origin debug
}

git checkout master