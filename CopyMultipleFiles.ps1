#To get powershell version
$version=$PSVersionTable
cls
$version

Get-Help Copy-Item -Examples

Copy-Item "E:\KT_Recording" -Destination "F:\"

#To copy single folder from one location to another
Copy-Item "E:\KT_Recording\SQL Server - Offshore - Onsite SyncUP - Friday, January 18, 2019 10.34.20 AM.mp4" -Destination "F:\KT_Recording"

#To get services status
$OutputServicesTableFormat=Get-Service | Where-Object {$_.Status -eq 'stopped'} ft-AutoSize | Out-GridView
#Doubt 
$OutputServicesTableFormat
#To get services info where status=running
Get-Service |Where-Object {$_.Status -eq 'running'}


#To copy multiple files from one loacation to another
$dest  = "F:\KT_Recording"
$files = Get-ChildItem -Path "E:\KT_Recording" -Filter "*.mp4" -Recurse

foreach ($file in $files) {
    $file_path = Join-Path -Path $dest -ChildPath $file.Name

    $i = 1

    while (Test-Path -Path $file_path) {
        $i++
        $file_path = Join-Path -Path $dest -ChildPath
        "$($file.BaseName)_$($i)$($file.Extension)"
    }

    Copy-Item -Path $file.FullName -Destination $file_path
}


#
Copy-Item "E:\KT_Recording" -Filter "*.mp4" -Recurse -Destination "F:\KT_Recording\KT_Recording"


