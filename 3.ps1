### 3.Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
[string]$PathUserFolder = "C:\M2T2_TKACHUK"                                # Путь к папке
[string]$NameDisk = "M2T2_TKACHUK"                                         # Название диска
New-Item -Path $PathUserFolder -ItemType "Directory"                       # Создание папки
New-PSDrive -Root $PathUserFolder -Name $NameDisk -PSProvider FileSystem   # Создание диска ассоциированного с папкой
###
Remove-Item $PathUserFolder -Recurse                                       # Удаление папки
Remove-PSDrive -Name $NameDisk -Force                                      # Удаление диска ассоциированного с папкой
#Get-PSDrive $NameDisk                                                     # Проверка