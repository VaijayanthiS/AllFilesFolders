#Creating folders and files
$ProjectLocation='F:\Powershell_Demo_Project'
function CreatingFoldersFiles($a)
{
       for($i=1; $i-le $a; $i++)
    {
      New-Item -Path $ProjectLocation -Name "Powershell_folder_{$i}" -ItemType Directory
      New-Item -Path $ProjectLocation -Name "Powershell_file_{$i}.txt" -ItemType File 
    }
    #LogWrite((Get-Date).ToString() + "::" + "Created files and folders")
}
CreatingFoldersFiles 5


#Function To count number of files and folders
function CountFoldersfiles
{ 
 #To count total number of files and folders
 $totalcount=Get-ChildItem -Path $ProjectLocation -Recurse | Measure-Object | %{$_.Count}
 Write-Host "Total number no of files and folders are=" $totalcount
 #To count number of folders
 $files = get-childitem -Path $ProjectLocation -recurse 
 $folders = $files | where-object { $_.PSIsContainer }
 Write-Host "Number of folders before deleting=" $folders.Count
 
 #$filescount = Get-ChildItem -Path $ProjectLocation -recurse -File #$filesNo = $filescount | where-object { $_.PSIsContainer } #Write-Host "Number of files before deleting=" $filesNo.Count
 
 #To count number of files

 #$filescount=Get-ChildItem -Path $ProjectLocation -Recurse -File | Measure-Object | %{$_.Count}
 #Write-Host "Number of files before deleting=" $filescount.Count
 Write-Host "Number of files before deleting="
 Get-ChildItem -Path $ProjectLocation -Recurse -File | Measure-Object | %{$_.Count}
}
CountFoldersfiles

#Function to create Log File
function CreateLogFile
{
 $logname=(Get-Date).ToString("MM-dd-yyyy")
 $logfile="F:\PowershellLogfile\$logname.log"
#}
#CreateLogFile
#Function to wite in log file
function LogWrite
{
param([string]$logstring)
Add-Content $logfile -Value $logstring
LogWrite((Get-Date).ToString() + "::" + "Created files and folders")

}



$logname=(get-date).ToString("mm-dd-yyyy")
$logfile="C:\logging\$logname.log"
#function logwrite
#{
param([string]$logstring)
Add-Content $logfile -Value $logstring
 

logwrite((get-date).Tostring()+": :" +"Demo for test ps logging....")
logwrite((get-date).Tostring()+": :"+"ended")


#}