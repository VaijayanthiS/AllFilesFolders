


cls

Get-Process | ForEach-Object {$_.ProcessName,$_.Id}

#To know length of the files in a directory
$ThisDir = “F:\KT_Recording”
Get-ChildItem $ThisDir | ForEach-Object –Process {if (!$_.PSIsContainer) {$_.Name; $_.Length / 1024; " " }}
#----------------------------------
$ThisDir = “F:\KT_Recording”
Get-ChildItem $ThisDir | ForEach-Object –Process {if (!$_.PSIsContainer) {$_.Name; $_.Length;}}



