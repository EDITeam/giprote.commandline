<#
**** Genprof,means [GenerateProjectsFolders]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20200110
**** Reason:Installing giprote scripts.
#>


$cur_path=$PWD
Write-Output "Downloading..."
# Write-Output $env:USERPROFILE
if (Test-Path "$env:USERPROFILE\.giprote")
{
    Remove-Item -Force -Recurse $env:USERPROFILE\.giprote
}
New-Item -Path $env:USERPROFILE\.giprote -ItemType directory | Out-Null
$giprote_dir="$env:USERPROFILE\.giprote\giprote.commandline"
# [environment]::SetEnvironmentvariable("Path", ";$giprote_dir", "User")
[environment]::SetEnvironmentvariable("giprote_dir", "$giprote_dir", "User")
# Write-Output $giprote_dir
# [environment]::GetEnvironmentvariable("giprote_dir", "User")
Copy-Item -Recurse -Force gpt.ps1 $giprote_dir
if (-not (Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"))
{
    New-Item -Type file -Force -Name $profil
}
Copy-Item -Recurse -Force .\scripts\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell
& $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Copy-Item -Recurse -Force .\scripts $env:giprote_dir
# Copy-Item -Recurse -Force .\templates $env:giprote_dir
Set-Location $env:USERPROFILE\.giprote
Remove-Item -Force -Recurse giprote.commandline
git clone https://github.com/haroldduan/giprote.commandline.git
Write-Output "Installing..."
Set-Location $env:giprote_dir
# git branch -r | grep -E "[0-9].[0-9].[0-9]" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
$remotes=$(git branch -r | Where-Object { $_ -match "^.*^(?!.*HEAD).*[0-9].*" })
foreach($remote in $remotes) {
    # Write-Output "$remote"
    git branch --track "${remote#origin/}" "$remote"
    $max="0.0.0"
    $temp="${remote#origin/}"
    # Write-Output "$temp"
    if ($temp -gt $max ) {
    $max = $temp
    # Write-Output "$max"
    }
}
git fetch --all
git pull --all
git checkout $max
Write-Output "Done!"
sh $giprote_dir\scripts\copyright.ps1 "copyright"
Get-Content -Encoding utf8 $giprote_dir\scripts\version
sh $giprote_dir\scripts\copyright.ps1 "giprote"
Set-Location $cur_path