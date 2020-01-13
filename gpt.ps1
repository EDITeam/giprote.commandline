<#
**** Genprof,means [GenerateProjectsFolders]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20200110
**** Reason:giprote scripts.
#>

# echo $env:USERPROFILE
# Write-Output $args

function version_info() {
    # .$env:giprote_dir\scripts\copyright.ps1 "copyright"
    .$env:giprote_dir\scripts\copyright.ps1 "giprote"
    Set-Location $env:giprote_dir
    # Get-Location
    git branch | Where-Object { $_ -match "[0-9].[0-9].[0-9]" }
}

function help_info() {
    Write-Output "
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
"
}

function upgrade() {
    Set-Location $env:giprote_dir
    Write-Output "Upgrading..."
    $remotes=$(git branch -r | Where-Object { $_ -match "^.*^(?!.*HEAD).*[0-9].*" })
    # Write-Output $remotes
    foreach($remote in $remotes) {
        # Write-Output "$remote"
        $max = "0.0.0"
        $temp = $remote.Trim().Substring(7,$remote.Trim().Length - 7)
        # Write-Output $temp
        git branch --track $temp $remote.Trim()
        # Write-Output "$temp"
        if ($temp -gt $max) {
            $max = $temp
            # Write-Output "$max"
        }
    }
    # Write-Output $max
    git fetch --all
    git pull --all
    git checkout $max
    git branch | Where-Object { $_ -match "[0-9].[0-9].[0-9]" }
}

$cur_path = ($PWD -replace "Path","")
# Write-Output $cur_path
# Set-Location $env:giprote_dir
if($args) {
    # Write-Output $args
    switch ($args) {
        { "-v","--version" -contains $_ } { version_info; break }
        { "-h","--help" -contains $_ } { help_info; break }
        { "init --commit" -contains $_ } { .$env:giprote_dir\scripts\initicomit.ps1; break }
        { "init --local-branch" -contains $_ } { .$env:giprote_dir\scripts\initilobra.ps1; break }
        { "gen --prof" -contains $_ } { .$env:giprote_dir\scripts\genprof.ps1; break }
        { "gen --readme" -contains $_ } { .$env:giprote_dir\scripts\generademe.ps1; break }
        { "gen --ignore" -contains $_ } { .$env:giprote_dir\scripts\genignore.ps1; break }
        { "-u","--upgrade" -contains $_ } { upgrade; break }
        Default { help_info }
    }
}
else {
    Write-Output "Fuck!"
}
Set-Location $cur_path