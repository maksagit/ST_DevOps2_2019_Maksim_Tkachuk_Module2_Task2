### 9. Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Set-Location HKLM:\SOFTWARE\Microsoft                           # Устанавливаем рабочее местоположение
Get-ChildItem > $PathFolder"\HKLM_SOFTWARE_Microsoft.csv"       # Сохраняем ветвь реестра в CSV
###
Remove-Item $PathFolder -Recurse                                # Удаление папки