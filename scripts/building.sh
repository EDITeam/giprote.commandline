#!/bin/bash
# Programmer:Harold.Duan
# Date:20200105
# Reason:Auto building and releasing current folders.
# Update Programmer:Harold.Duan
# Date:20200106
# Reason:Fixing building scripts bug.

sh $(cd $(dirname $0); pwd -P)/copyright.sh "copyright"
echo \ '
###################################################################
# building                                                        #
# Building and packaging project template structures.             #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
read -p "Enter the version,like 1.0.0 , 1.0.1 , 2.0.0 ... > " version
echo "Current version is $version..."
echo "Building the folder package..."
# root_path=$(cd `dirname $0`; pwd)
cur_path=$(cd $(dirname $0); pwd)
root_path=$(dirname $cur_path)
root_name=$(basename $root_path)
# echo $cur_path
# echo $root_name
echo "Removing the old packages..."
rm -rf gpt
cp giprote.sh gpt
sudo chmod -R 755 gpt
# rm -rf $root_path/$root_name*.zip
rm -rf $root_path/gpt*.zip
rm -rf "gpt_v$version"
cp $(cd $(dirname $0); pwd -P)/scripts/version "gpt_v$version"
echo "Packaging the version [$version] packages..."
cd $root_path
# zip -r $root_name"_"$version.zip \
    # .templates .scripts *.sh *.ps1 *.md
zip -r "gpt_v"$version.zip \
    gpt templates scripts *.sh *.ps1 *.md "gpt_v$version"
rm -rf "gpt_v$version"
echo "Done!"