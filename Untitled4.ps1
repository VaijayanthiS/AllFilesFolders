$lctn="C:\logging"
$time = New-TimeSpan -Minutes 2
Set-Date -Adjust $time
if(($_.LastWriteTime -gt $time))
{
New-Item -path $lctn -Name "folder1" -ItemType Directory
}




New-Item -path $lctn -Name "folder1" -ItemType Directory | Where-Object {($_.LastWriteTime -gt $time)}  