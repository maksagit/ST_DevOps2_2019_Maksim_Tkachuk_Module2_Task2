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