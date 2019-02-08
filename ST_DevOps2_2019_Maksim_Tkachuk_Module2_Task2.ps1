### 1. Просмотреть содержимое ветви реeстра HKCU
Get-ChildItem HKCU:\
#Список провайдеров, доступных в данный момент оболочке:
#Get-PSDrive

### 2. Создать, переименовать, удалить каталог на локальном диске
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к оригинальной папке
[string]$PathRenameFolder = "C:\TMP_RENAMED_FOLDER_POWERSHELL"  # Путь к переименованной папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Rename-Item -Path $PathFolder -NewName $PathRenameFolder        # Переименование папки
###
Remove-Item $PathRenameFolder -Recurse                          # Удаление папки

### 3.Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
[string]$PathUserFolder = "C:\M2T2_TKACHUK"                                # Путь к папке
[string]$NameDisk = "M2T2_TKACHUK"                                         # Название диска
New-Item -Path $PathUserFolder -ItemType "Directory"                       # Создание папки
New-PSDrive -Root $PathUserFolder -Name $NameDisk -PSProvider FileSystem   # Создание диска ассоциированного с папкой
###
Remove-Item $PathUserFolder -Recurse                                       # Удаление папки
Remove-PSDrive -Name $NameDisk -Force                                      # Удаление диска ассоциированного с папкой
#Get-PSDrive $NameDisk                                                     # Проверка

### 4. Сохранить в текстовый файл на созданном диске список запущенных(!) служб.
### Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.
[string]$PathUserFolder = "C:\M2T2_TKACHUK"                                # Путь к папке
[string]$NameDisk = "M2T2_TKACHUK"                                         # Название диска
New-Item -Path $PathUserFolder -ItemType "Directory"                       # Создание папки
New-PSDrive -Root $PathUserFolder -Name $NameDisk -PSProvider FileSystem   # Создание диска ассоциированного с папкой
Get-Service | Where-Object {$_.Status -eq 'Running'} > $PathUserFolder"\Service-Status.txt"    # Запись запущенных служб в txt
Get-ChildItem -Path $NameDisk                                              # Просмотр диска
Get-Content $PathUserFolder"\Service-Status.txt"                           # Содержимое Service-Status.txt в консоли PS
###
Remove-Item $PathUserFolder -Recurse                                       # Удаление папки
Remove-PSDrive -Name $NameDisk -Force                                      # Удаление диска ассоциированного с папкой

### 5. Просуммировать все числовые значения переменных текущего сеанса.
[int]$tmp = 0
foreach ($i in (Get-Variable | Select-Object Value))
{
    if ($i.Value -is [int])
    {
        Write-host("Value: " + $i.Value)
        $tmp += $i.Value
    }
}
Write-Host("Sum = $tmp")

### 6. Вывести список из 6 процессов занимающих дольше всего процессор.
Get-Process | Sort-Object UserProcessorTime -Descending -ErrorAction SilentlyContinue | `
Select-Object Name, VM, Id, UserProcessorTime -First 6

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

### 8. Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp
$Array = @(Get-ChildItem "C:\Windows" -Exclude "*.tmp" -Recurse  -file -ErrorAction SilentlyContinue | Select-Object Length)
$Files_Length = 0
foreach ($i in $Array)
{
     $Files_Length += ($i.Length/1000000)    
}

Write-Output("Files Length: " + $Files_Length + " Mb")

### 9. Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Set-Location HKLM:\SOFTWARE\Microsoft                           # Устанавливаем рабочее местоположение
Get-ChildItem > $PathFolder"\HKLM_SOFTWARE_Microsoft.csv"       # Сохраняем ветвь реестра в CSV
###
Remove-Item $PathFolder -Recurse                                # Удаление папки

### 10. Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к оригинальной папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Get-History > $PathFolder"\TMP_History_PS.xml"                  # Сохранние Hostory команд в файл
#Get-History | Export-Clixml -Path $PathFolder"\TMP_History_PS.xml"    # Экспорт истории команд PS в формат XML

### 11.	Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой 
### записи, в виде 5 любых (выбранных Вами) свойств.
Get-Content $PathFolder"\TMP_History_PS.xml" | Select-Object Length, ReadCount, PSChildName, PSDrive, PSPath
###
Remove-Item $PathFolder -Recurse                                # Удаление папки

### 12.	Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                           # Путь к папке TMP_FOLDER_POWERSHELL
[string]$PathRenameFolder = "C:\TMP_RENAMED_FOLDER_POWERSHELL"             # Путь к переименованной папке TMP_RENAMED_FOLDER_POWERSHELL
[string]$PathUserFolder = "C:\M2T2_TKACHUK"                                # Путь к папке M2T2_TKACHUK
[string]$NameDisk = "M2T2_TKACHUK"                                         # Название диска
Remove-Item -Path $PathFolder -Recurse -ErrorAction SilentlyContinue       # Удаляем папку C:\TMP_FOLDER_POWERSHELL
Remove-Item -Path $PathRenameFolder -Recurse -ErrorAction SilentlyContinue # Удаляем папку C:\TMP_RENAMED_FOLDER_POWERSHELL
Remove-Item -Path $PathUserFolder -Recurse -ErrorAction SilentlyContinue   # Удаляем папку C:\M2T2_TKACHUK
Remove-PSDrive -Name $NameDisk -Force -ErrorAction SilentlyContinue        # Удаляем диск M2T2_TKACHUK
###### Последний 12й пункт выполнен в формате удаления всевозможного мусора, ########
###### который может создавать скрип                                         ########