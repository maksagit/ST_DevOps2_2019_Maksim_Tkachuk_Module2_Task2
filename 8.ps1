### 8. Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp
$Array = @(Get-ChildItem "C:\Windows" -Exclude "*.tmp" -Recurse  -file -ErrorAction SilentlyContinue | Select-Object Length)
$Files_Length = 0
foreach ($i in $Array)
{
     $Files_Length += ($i.Length/1000000)    
}

Write-Output("Files Length: " + $Files_Length + " Mb")