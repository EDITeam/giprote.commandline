#!/bin/bash
# Genprof,means [GenerateProjectsFolders]'s abbreviation.
# Programmer:Harold.Duan
# Date:20190717
# Reason:[GenerateProjectsFolders] Auto generate project's folders.
# Update Date:20190730
# Reason:Automatic generating.gitkeep file,for git empty folders.

sh $(cd $(dirname $0); pwd -P)/copyright.sh "copyright"
echo \ '
###################################################################
# Genprof                                                         #
# Auto generate projects folders.                                 #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
read -p "Enter the project's period,like p1,p2,p3... > " period
echo "Current project period is $period..."
echo "Generating the project folders..."
mkdir $period
cur_path=$(cd $(dirname $0); pwd)
root_path=$(dirname $cur_path)
echo $root_path
# sudo ls -la $root_path/templates
cd $period
touch .gitkeep
sudo cp -r $root_path/templates/* .
echo "Generating source_codes sub folders..."
echo "Done!"