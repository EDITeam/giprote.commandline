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

function CreateSubFolders([string]$root_path,[string[]]$sub_folders)
{
    <#echo $root_path#>
    cd $root_path
    foreach($item in $sub_folders)
    {
        mkdir $item
        echo "Folder [$item] and .gitkeep is created!"
        cd $item 
        New-Item .gitkeep
        cd ..
    }
}

function Read-InputBoxDialog([string]$Message, [string]$WindowTitle, [string]$DefaultText)
{
    Add-Type -AssemblyName Microsoft.VisualBasic
    return [Microsoft.VisualBasic.Interaction]::InputBox($Message, $WindowTitle, $DefaultText)
}

function CreateFoldersStructure([string]$root_path,[string]$root_name)
{
    CreateSubFolders $root_path $root_name
    $current_path = "$root_path\$root_name"
    echo "This current folder's path :[$current_path]!"
    echo "Creating the project's folder..."
    Copy-Item $root_path/.templates/*  $root_path/$root_name -Recurse
}

try
{
    $folder_name = Read-InputBoxDialog "Please input the projects folder's name..." "Folders Naming" "p1"
    echo "You input folders name is $folder_name!"
    $folder_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
    CreateFoldersStructure $folder_path $folder_name
}
catch
{
    Write-Host "Caught an exception:" -ForegroundColor Red
    Write-Host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
    Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red
}