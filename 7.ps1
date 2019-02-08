### 7. Вывести список названий и занятую виртуальную память (в Mb) каждого процесса, разделённые знаком
### тире, при этом если процесс занимает более 100Mb – выводить информацию красным цветом, иначе зелёным.
$Array = @(Get-Process| Select-Object VirtualMemorySize, Name)
foreach($i in $Array){
    if (($i.VirtualMemorySize / 1000000) -gt 100 )
    {
        Write-Host("Process: " + $i.Name + "---" + ( $i.VirtualMemorySize / 1000000) + " Mb") -ForegroundColor Red
    }
    else 
    {
        Write-Host("Process: " + $i.Name + "---" + ( $i.VirtualMemorySize / 1000000) + " Mb") -ForegroundColor Green    
    }
    
}