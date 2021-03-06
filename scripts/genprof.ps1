﻿<#
**** Genprof,means [GenerateProjectsFolders]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20180607
**** Reason:[GenerateProjectsFolders] Auto generate project's folders.
**** Update Programmer:Harold.Duan
**** Update Date:20190717
**** Update Reason:[GenerateProjectsFolders] Alter the project's folders structures which auto generated by scripts.
**** Update Date:20190730
**** Update Reason:Automatic generating.gitkeep file,for git empty folders.
**** Update Date:20200103
**** Update Reason:Automatic copy documents structures from templates.
#>

function Read-InputBoxDialog([string]$Message, [string]$WindowTitle, [string]$DefaultText)
{
    Add-Type -AssemblyName Microsoft.VisualBasic
    return [Microsoft.VisualBasic.Interaction]::InputBox($Message, $WindowTitle, $DefaultText)
}

.$env:giprote_dir\scripts\copyright.ps1 "copyright"
Write-Output '
###################################################################
# Genprof                                                         #
# Auto generate projects folders.                                 #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
$period = Read-InputBoxDialog "Please input the projects folder's name..." "Folders Naming" "p1"
Write-Output "You input folders name is $period!"
$folder_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
Write-Output "Current project period is $period..."
Write-Output "Generating the project folders..."
if (Test-Path $period)
{
    Remove-Item -Recurse -Force $period
}

New-Item -Name $period -ItemType directory | Out-Null
# sudo ls -la $root_path/templates
Set-Location $period
# Get-Location
New-Item -Path . -ItemType file -Name .gitkeep | Out-Null
Copy-Item -Recurse -Force $env:giprote_dir\templates\* .
Set-Location $folder_path
Write-Output "Generating source_codes sub folders..."
Write-Output "Done!"