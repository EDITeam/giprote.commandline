<#
**** Genprof,means [GenerateReadMe]'s abbreviation.
**** Programmer:Aaton.Kang
**** Date:20190723
**** Update Programmer:Harold.Duan
**** Date:20190903
**** Reason:[GenerateProjectsFolders] Auto generate\update README.md file.
**** Update Programmer:Harold.Duan
**** Date:20200105
**** Reason:Fixing a bug,which generated linked-address is invaild.
**** Update Programmer:Harold.Duan
**** Date:20200105
**** Reason: Fixinga bug,which generated linked-address lists presentation problem.

#>

function WriteContents([String]$file,[String]$cur_path,[Int]$depth,[String]$last_dir="")
{
    $depth = $depth + 1
    $cur_info = Get-ChildItem $root_path | Measure-Object
    # echo $cur_dir
    # echo $cur_info
    if ($cur_info.Count -gt 0)
    {
        Get-ChildItem $cur_path -Exclude *.sh,*.ps1,*.md,.git*,addon,service,web,gpt* | ForEach-Object -Process{
            $cur_dir = $_.Name
            Write-Output $cur_dir
            # echo $_.Directory
            # echo $_.FullName
            $tab = "    "*($depth - 1)
            if($last_dir -ne ""){
                Write-Output "$tab+ [$cur_dir](./$last_dir/$cur_dir)  " >> $file
            }
            else{
                Write-Output "$tab+ [$cur_dir](./$cur_dir)  " >> $file
            }
            if($_ -isnot [System.IO.FileInfo])
            {
                if($last_dir -ne ""){
                    $last_dir = "$last_dir/$cur_dir"
                }
                else{
                    $last_dir = $cur_dir
                }
                WriteContents $file $_.FullName $depth $last_dir
            }
        }
    }
}

.$env:giprote_dir\scripts\copyright.ps1 "copyright"
Write-Output '
###################################################################
# Generademe                                                      #
# Auto generate\update README.md file.                            #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
Write-Output "Generating README..."
# $cur_file = $MyInvocation.MyCommand.Definition
# $root_path = Split-Path -Parent $cur_file
# $root_name =  Split-Path $root_path -Leaf
$root_path = $PWD
# Write-Output $root_path
$root_name =  Split-Path $root_path -Leaf
# Set-Location $root_path
Write-Output "Removing old file..."
# Remove old README.md
if (Test-Path README.md)
{
    Remove-Item -Recurse -Force README.md
}
# echo "Creating README..."
# New README.md
# New-Item README.md
# Write README top contents
Write-Output "# $root_name

## Overview

+ [Overview](#Overview)  
+ [Structures](#Structures)  
+ [Contributors](#Contributors)  
+ [Thanks](#Thanks)  


## Structures
" >> README.md
Write-Output "Scanning folders and files..."
WriteContents "$root_path/README.md" $root_path 0 ""
# Write README bottom contents
Write-Output "
## ***Contributors***

<p align=`"left`">
  <a href=`"http://rds.avatech.com.cn:7070/org/Product/members`">
    <a href=`"http://rds.avatech.com.cn:7070/harold.duan`">
    <img src=`"http://rds.avatech.com.cn:7070/user/avatar/harold.duan/290`" width=`"70`" alt=`"Harold.Duan`" /></a>
    <a href=`"http://rds.avatech.com.cn:7070/pancy.fan`">
    <img src=`"http://rds.avatech.com.cn:7070/user/avatar/pancy.fan/290`" width=`"70`" alt=`"Pancy.Fan`" /></a>
    <a href=`"http://rds.avatech.com.cn:7070/aaton.kang`">
    <img src=`"http://rds.avatech.com.cn:7070/user/avatar/aaton.kang/290`" width=`"70`" alt=`"Aaton.Kang`" /></a>
    <a href=`"http://rds.avatech.com.cn:7070/shuo.liu`">
    <img src=`"http://rds.avatech.com.cn:7070/user/avatar/shuo.liu/290`" width=`"70`" alt=`"Shuo.Liu`" /></a>
  </a>
</p>

## ***Thanks***

<h3 align=`"left`">
  <a href=`"http://rds.avatech.com.cn:7070/Project`">
  <img src=`"http://rds.avatech.com.cn:7070/user/avatar/Project/140`" width=`"70`" alt=`"Team RDC-Project`" /></a>
  <a href=`"http://rds.avatech.com.cn:7070/Product`">
  <img src=`"http://rds.avatech.com.cn:7070/user/avatar/Product/140`" width=`"70`" alt=`"Team RDC-Product`" /></a>
</h3>

***Auto generating by Generademe.***
" >> README.md
Write-Output "Done!"