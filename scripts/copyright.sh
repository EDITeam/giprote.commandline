#!/bin/bash
# Programmer:Harold.Duan
# Date:20200106
# Reason:Copyright log output.


red='\e[0;41m' # 红色 
RED='\e[1;31m'
green='\e[0;32m' # 绿色  
GREEN='\e[1;32m'
yellow='\e[5;43m' # 黄色  
YELLOW='\e[1;33m'
blue='\e[0;34m' # 蓝色  
BLUE='\e[1;34m'
purple='\e[0;35m' # 紫色  
PURPLE='\e[1;35m'
cyan='\e[4;36m' # 蓝绿色  
CYAN='\e[1;36m'
WHITE='\e[1;37m' # 白色
NC='\e[0m' # 没有颜色

ReadmePrint(){
  echo \ '
###################################################################
# Saucelabs support                                               #
# Turn on these settings with                                     #
#  --config=saucelabs                                             #
###################################################################
  '
}

CopyrightPrint() {
  echo \ '
    _   _       _   _   _ _ _ _ _   _ _ _ _   _ _ _    _     _
   / \  \\\     //  / \ |_ _   _ _| | _ _ _|  /  _ _|  | |_ _| |
  / △ \  \\\   //  / △ \    | |     | _ _ _  | /       |  _ _  |
 / ___ \  \\\_//  / ___ \   | |     | _ _ _  | \_ _    | |   | |
/_/   \_\  \_/  /_/   \_\  |_|     |_ _  _|  \_ _ _|  |_|   |_|
'
}

PlatformPrint() {
    echo \ '
 _ _ _ _        _        _     _    _       _    _ _ _    _ _ _ _ _
|  _ _  \      / \      | |   | |  | |     | |  |  _  \  |_ _   _ _|
| |   \  \    / _ \     | |_ _| |  | |     | |  | |_)  )     | |
| |    )  )  / / \ \    |  _ _  |  \ \     / /  | |_ _/      | |
| |_ _/  /  / /_ _\ \   | |   | |   \ \_ _/ /   | |          | |
|_ _ _ _/  /_/     \_\  |_|   |_|    \_ _ _/    |_|          |_|
'
}

GiprotePrint() {
    echo \ '
         _                            _
  __ _  |_|  _  __   _ ___   _ _   __| |__    _ __
 / _  \  _  |  _  \ | `___| / _ \ |__   __|  / _  \
| (_| | | | | |_) ) | |    | | | |   | |    | |_|_/
 \__  | | | | |_ /  | |    | |_| |   | |_   | \__ _
 |___/  |_| |_|     |_|     \_ _/    \___|   \_ __/
'
}

Print() {
  # echo $1
  if [ "$1" = "copyright" ]
  then
    CopyrightPrint
  elif [ "$1" = "platform" ]
  then
    PlatformPrint
  elif [ "$1" = "giprote" ]
  then
    GiprotePrint
  else
    echo "Welcome to Dahupt!"
  fi
}

# echo $1
Print $1