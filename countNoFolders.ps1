#To create single folder and file
$Location= 'E:\PowershellScripts'
New-Item -Path $Location -Name "Powershell_folders" -ItemType Directory
New-Item -Path $Location -Name "Powershell_file1" -ItemType File
#To create multiple folders at a time
$Location= 'E:\PowershellScripts'

for($i=1; $i-le 10; $i++)
{
New-Item -Path $Location -Name "Powershell_folders_{$i}" -ItemType Directory
}



$files = get-childitem -Path E:\PowershellScripts -recurse 
$folders = $files | where-object { $_.PSIsContainer }
Write-Host $folders.Count





while()
{

}


