Get-ChildItem –Path "C:\logging" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-1))} | Remove-Item
