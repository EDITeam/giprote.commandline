function runGiprote{
   # $cur_path = Split-Path -Parent $MyInvocation.MyCommand.Definition;
   # Write-Output $cur_path
   # Write-Output $env:giprote_dir
   $script="$env:giprote_dir\gpt.ps1"
   # Get-ChildItem -Name
   # C:\Users\Administrator\.giprote\gpt.ps1
   # echo $script
   # PowerShell -File $scripts
   # $code = [scriptblock]::Create($script)
   # & $code
   #. "$script"
   # cd $env:giprote_dir
   # Write-Output $args
   & $script $args
}
# pwd
Set-Alias gpt runGiprote