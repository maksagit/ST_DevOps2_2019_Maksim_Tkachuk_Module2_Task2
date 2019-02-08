### 2. Создать, переименовать, удалить каталог на локальном диске
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к оригинальной папке
[string]$PathRenameFolder = "C:\TMP_RENAMED_FOLDER_POWERSHELL"  # Путь к переименованной папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Rename-Item -Path $PathFolder -NewName $PathRenameFolder        # Переименование папки
###
Remove-Item $PathRenameFolder -Recurse                          # Удаление папки