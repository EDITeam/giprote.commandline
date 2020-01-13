<#
**** Programmer:Harold.Duan
**** Date:20200111
**** Reason:Copyright output.
#>



function ReadmePrint(){
    Write-Output '
###################################################################
# Saucelabs support                                               #
# Turn on these settings with                                     #
#  --config=saucelabs                                             #
###################################################################
'
}

function CopyrightPrint() {
    Write-Output '
    _   _       _   _   _ _ _ _ _   _ _ _ _   _ _ _    _     _
   / \  \\     //  / \ |_ _   _ _| | _ _ _|  /  _ _|  | |_ _| |
  / A \  \\   //  / A \    | |     | _ _ _  | /       |  _ _  |
 / ___ \  \\_//  / ___ \   | |     | _ _ _  | \_ _    | |   | |
/_/   \_\  \_/  /_/   \_\  |_|     |_ _  _|  \_ _ _|  |_|   |_|
'
}

function PlatformPrint() {
    Write-Output '
 _ _ _ _        _        _     _    _       _    _ _ _    _ _ _ _ _
|  _ _  \      / \      | |   | |  | |     | |  |  _  \  |_ _   _ _|
| |   \  \    / _ \     | |_ _| |  | |     | |  | |_)  )     | |
| |    )  )  / / \ \    |  _ _  |  \ \     / /  | |_ _/      | |
| |_ _/  /  / /_ _\ \   | |   | |   \ \_ _/ /   | |          | |
|_ _ _ _/  /_/     \_\  |_|   |_|    \_ _ _/    |_|          |_|
'
}

function GiprotePrint() {
    Write-Output '
         _                            _
  __ _  |_|  _  __   _ ___   _ _   __| |__    _ __
 / _  \  _  |  _  \ | `___| / _ \ |__   __|  / _  \
| (_| | | | | |_) ) | |    | | | |   | |    | |_|_/
 \__  | | | | |_ /  | |    | |_| |   | |_   | \__ _
 |___/  |_| |_|     |_|     \_ _/    \___|   \_ __/
'
}

function Print() {
    # echo $args
    switch ($args) {
        "copyright" { CopyrightPrint; break }
        "platform" { PlatformPrint; break }
        "giprote" { GiprotePrint; break }
        Default { Write-Output "Welcome to Dahupt!" }
    }
}

# echo $args
Print $args