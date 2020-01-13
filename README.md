# giprote.commandline ![version](https://img.shields.io/badge/version-1.2.0-red.svg?cacheSeconds=2592000) ![license](https://img.shields.io/badge/license-Apache2.0-blue.svg) ![date](https://img.shields.io/date/1578499200.svg)

+ [Overview](#Overview)  
+ [Dependency](#Dependency)  
+ [Install](#Install)  
  - [Linux|MacOS](#Linux|MacOS)  
  - [Windows](#Windows)  
+ [Usage](#Usage)  
+ [Upgrade](#Upgrade)
+ [Contributors](#Contributors)  
+ [Thanks](#Thanks)  

## Overview  

giprote,it is AVATech gitea project template kits.

```
haroldduan@Think-Harold:~$ gpt -v
         _                            _
  __ _  |_|  _  __   _ ___   _ _   __| |__    _ __
 / _  \  _  |  _  \ | `___| / _ \ |__   __|  / _  \
| (_| | | | | |_) ) | |    | | | |   | |    | |_|_/
 \__  | | | | |_ /  | |    | |_| |   | |_   | \__ _
 |___/  |_| |_|     |_|     \_ _/    \___|   \_ __/

  0.1.1
* 1.0.0
haroldduan@Think-Harold:~$ gpt -h

Usage: 
  gpt -h|--help                  Show help message
  gpt -v|--version               Print out the installed version of gpt
  gpt init                       Init repo
    --commit                     Init repo commit
    --local-branch               Init repo local branch
  gpt gen                        Generate source
    --prof                       Generate source project folders
    --readme                     Generate source README.md
    --ignore                     Generate source .gitignore
  gpt -u|--upgrade               Upgrade to the latest version.

Example:
  gpt init --commit              Init current repo commit
  gpt init --local-branch        Init current repo local branch
  gpt gen --prof                 Generate source project folders
  gpt gen --readme               Generate source README.md
Note:
  If you have some problems,you can pull iusses to this repo:
    https://github.com/EDITeam/giprote.commandline.git
```

## Dependency

+ **[git](https://git-scm.com/)**

## Install

### Linux|MacOS

***Install by bash***

```
$ wget -qO- https://raw.githubusercontent.com/haroldduan/giprote.commandline/1.2.0/install.sh | bash
```

*or*

```
$ curl -o- https://raw.githubusercontent.com/haroldduan/giprote.commandline/1.2.0/install.sh | bash
```

### Windows

***Install by PowerShell***

```
PS C:\Users\Administrator> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/haroldduan/giprote.commandline/1.2.0/install.ps1'))
```

## Usage

+ **help**

```
$ gpt -h
```

*or*

```
$ gpt --help
```

+ **version**

```
$ gpt -v
```

*or*

```
$ gpt --version
```

+ **init commit**

```
$ gpt init --commit
```

+ **init local branches**

```
$ gpt init --local-branch
```

+ **generate project folders**

```
$ gpt gen --prof
```

+ **generate repo readme**

```
$ gpt gen --readme
```

## Upgrade

```
$ gpt -u
```

*or*

```
$ gpt --upgrade
```

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