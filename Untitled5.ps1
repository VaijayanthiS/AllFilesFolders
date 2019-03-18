      
      
      $lctn="C:\logging"
      for($i=1; $i-le $a; $i++)
    {
      New-Item -Path $lctn -Name "Powershell_folder_{$i}" -ItemType Directory
      New-Item -Path $lctn -Name "Powershell_file_{$i}.txt" -ItemType File 
    }