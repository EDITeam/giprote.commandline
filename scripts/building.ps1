<#
**** Programmer:Harold.Duan
**** Date:20200112
**** Reason:Auto building and releasing current folders.
#>

function Read-InputBoxDialog([string]$Message, [string]$WindowTitle, [string]$DefaultText)
{
    Add-Type -AssemblyName Microsoft.VisualBasic
    return [Microsoft.VisualBasic.Interaction]::InputBox($Message, $WindowTitle, $DefaultText)
}

.\scripts\copyright.ps1 "copyright"
Write-Output '
###################################################################
# building                                                        #
# Building and packaging project template structures.             #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
$version = Read-InputBoxDialog "Enter the version,like 1.0.0 , 1.0.1 , 2.0.0 ... > " "Folders Naming" "1.0.0"
Write-Output "Current version is $version..."
Write-Output "Building the folder package..."
# root_path=$(cd `dirname $0`; pwd)
# $cur_path = $PWD
# Write-Output $cur_path
# ecWrite-Outputho $root_name
Write-Output "Removing the old packages..."
Remove-Item -Recurse -Force gpt.ps1
Copy-Item -Recurse -Force giprote.ps1 gpt.ps1
Remove-Item gpt*.zip
Copy-Item -Recurse -Force .\scripts\version "gpt_v$version"
Write-Output "Packaging the version [$version] packages..."
# zip -r "gpt_v"$version.zip gpt templates scripts *.sh *.ps1 *.md "gpt_v$version"
Compress-Archive -Path .\* .\"gpt_v$version.zip"
Remove-Item "gpt_v$version"
Write-Output "Done!"