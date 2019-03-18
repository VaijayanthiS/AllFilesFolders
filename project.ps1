#log file
$LogName=(get-date).ToString('dd-MM-yyyy')
$LogFile="F:\PowershellLogfile\$LogName.log"

function WriteLog
{
param([string]$LogString)
Add-Content $LogFile -Value $LogString
}
#---------------------------------------------------------------------------------
#calling function to create Log file
WriteLog "Hi, welcome to PowerShell"
#---------------------------------------------------------------------------------
#Creating 'N' number of folders and files
$Location= 'F:\Powershell_Demo_Project'
function CreatFolders($NumOfFolders,$NumOfFiles)
{
 for($i=1;$i-le$NumOfFolders;$i++)
  {
    New-Item -Path $Location -Name "TestFolder$i" -ItemType directory
    New-Item -Path $Location -Name "EmptyFolder$i" -ItemType directory
  }

 for($i=1;$i-le$NumOfFolders;$i++)
  {
     $FileLocation="$Location\TestFolder$i"
    for($j=1;$j-le$NumOfFiles;$j++)
     {
          New-Item -Path $FileLocation -Name "TestFile$j.txt" -ItemType file
     }

  }
    WriteLog((Get-Date).ToString() + "____::"+$NumOfFolders+"Folders and "+$NumOfFiles + "Files are created")

}
#---------------------------------------------------------------------------------------------------------------
#calling function to create folders & files
CreatFolders 5 6
#---------------------------------------------------------------------------------
#To get count of folders & files
function CountFoldersFiles
{
#To get folder count
$FolderLocation=Get-ChildItem -Path $Location -Recurse
$folders=$FolderLocation|Where-Object{$_.PSIscontainer}
Write-Host "Number of folders are=" $folders.count
#Writing into Log File
WriteLog((Get-Date).ToString() + "____:: Total folder count="+$folders.count)

#To get file count
$Files=Get-ChildItem -Path $Location -Recurse -file|Measure-Object|%{$_.count}
$filenum=$Files
Write-Host "Number of files are=" $Files
#Writing into Log File
WriteLog((Get-Date).ToString() + "____:: Total files count="+$Files)
}
#---------------------------------------------------------------------------------
#calling function to count folders & files
CountFoldersFiles
#---------------------------------------------------------------------------------
#Function to calculate size of folders
function CalSize
{
#Get-ChildItem $Location | ForEach-Object –Process {if (!$_.PSIsContainer) {$_.Name; $_.Length / 1024; " " }}

Get-ChildItem -Recurse $location | Measure-Object -Property length -Sum
WriteLog((Get-Date).ToString() + "____:: Total files size is calculated")
}
#---------------------------------------------------------------------------------
#calling function to get size
CalSize
#---------------------------------------------------------------------------------
#Function to delete empty folders
function DeletingEmptyFolders
{
Remove-Item -Path $location -Filter "Emptyfolder_.*"

$filename= Get-ChildItem -Path $location -Recurse
$folders=$filename|Where-Object{$_.PSIscontainer}
Write-Host "no. of folders after deleting=" $folders.Count

Write-Host "no of files=" $filenum
WriteLog((get-date).ToString()+": :"+  "Deleted Empty folders")
}
#---------------------------------------------------------------------------------
#calling function to delete empty folders
DeletingEmptyFolders




#------------------------------------------------------------------------------------------------------
#To copy multiple files/folders from one loacation to another
$destination  = "F:\CopiedFiles"
$filesLocation = Get-ChildItem -Path "F:\Powershell_Demo_Project\TestFolder1" -Filter "*.txt" -Recurse
function CopyFiles
{
   foreach ($file in $filesLocation) 
     {
    $file_path = Join-Path -Path $destination -ChildPath $file.Name

    $i = 1

     while (Test-Path -Path $file_path) 
       {
        $i++
        $file_path = Join-Path -Path $destination -ChildPath
        "$($file.BaseName)_$($i)$($file.Extension)"
        }

    Copy-Item -Path $file.FullName -Destination $file_path
     }
}
#------------------------------------------------------------------------
#Calling function to copy files
CopyFiles

Set-ExecutionPolicy -ExecutionPolicy 