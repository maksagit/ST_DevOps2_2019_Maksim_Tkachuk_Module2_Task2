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