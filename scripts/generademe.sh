#!/bin/bash
# Generademe,means [GenerateReadMe]'s abbreviation.
# Programmer:Harold.Duan
# Date:20180718
# Reason:[GenerateReadMe] Auto generate\update README.md file.
# Update Programmer: Harold.Duan
# Date: 20190918
# Reason: [GenerateProjectsFolders] Auto generate\update README.md file.
# Update Programmer: Harold.Duan
# Date: 20200105
# Reason: Fixing a bug,which generated linked-address is invaild.
# Update Programmer: Harold.Duan
# Date: 20200105
# Reason: Fixing a bug,which generated linked-address lists presentation problem.

WriteContents() {
  cur_files=$(ls $2 -L -I ".git*" -I "*.sh" -I "*.ps1" \
  -I "*.md" -I "addon" -I "service" -I "web" -I ".vscode" \
  -I "gpt*")
  for file in $cur_files
  do
    if [ x"$file" != x"." -a x"$file" != x".." ];then
      echo "Writing project sub files [$file]..."
      if [ "$4" = "" ];then
        cur_dir="$file"
        tab=""
        echo "$tab+ [$file](./$file)  " >> $1
      else
        cur_dir="$4/$file"
        tab=$(printf '    %.0s' $(seq $3))
        echo "$tab+ [$file](./$4/$file)  " >> $1
      fi
      depth=`expr $3 + 1`
      if [ -d "$2/$file" ];then
        WriteContents "$1" "$2/$file" $depth "$cur_dir"
      fi
    fi
  done
}

sh $(cd $(dirname $0); pwd -P)/copyright.sh "copyright"
echo \ '
###################################################################
# Generademe                                                      #
# Auto generate\update README.md file.                            #
# AVATech-RDC support                                             #
# Copyright AVATech-RDC@2020                                      #
###################################################################
'
echo "Generating README..."
echo "Removing old file..."
rm -rf README.md
cur_file="README.md"
cur_date="`date +%Y-%m-%d`"
root_path=$(cd $(dirname $0); pwd)
root_name=${root_path##*/}
echo "Writing head contents..."
cat>"${cur_file}"<<EOF
# $root_name  

## Overview  

+ [Overview](#Overview)  
+ [Structures](#Structure) 
+ [Contributors](#Contributors)  
+ [Thanks](#Thanks) 

## Structures

EOF
echo "Writing project peroid contents..."
WriteContents ./README.md $root_path 0 ""
echo "Writing foot contents..."
cat>>"${cur_file}"<<EOF

## ***Contributors***

<a href="http://rds.avatech.com.cn:7070/org/Product/members">
  <a href="http://rds.avatech.com.cn:7070/harold.duan"><img src="http://rds.avatech.com.cn:7070/user/avatar/harold.duan/290" width="70" alt="Harold.Duan" /></a>
  <a href="http://rds.avatech.com.cn:7070/pancy.fan"><img src="http://rds.avatech.com.cn:7070/user/avatar/pancy.fan/290" width="70" alt="Pancy.Fan" /></a>
  <a href="http://rds.avatech.com.cn:7070/aaton.kang"><img src="http://rds.avatech.com.cn:7070/user/avatar/aaton.kang/290" width="70" alt="Aaton.Kang" /></a>
  <a href="http://rds.avatech.com.cn:7070/shuo.liu"><img src="http://rds.avatech.com.cn:7070/user/avatar/shuo.liu/290" width="70" alt="Shuo.Liu" /></a>
</a>

## ***Thanks***

<h3 align="left">
  <a href="http://rds.avatech.com.cn:7070/Project"><img src="http://rds.avatech.com.cn:7070/user/avatar/Project/140" width="70" alt="Team RDC-Project" /></a>
  <a href="http://rds.avatech.com.cn:7070/Product"><img src="http://rds.avatech.com.cn:7070/user/avatar/Product/140" width="70" alt="Team RDC-Product" /></a>
</h3>

***Auto generating by Generademe.***
EOF
echo "Done!"