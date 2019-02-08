### 10. Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.
[string]$PathFolder = "C:\TMP_FOLDER_POWERSHELL"                # Путь к оригинальной папке
New-Item -Path $PathFolder -ItemType "Directory"                # Создание папки
Get-History > $PathFolder"\TMP_History_PS.xml"                  # Сохранние Hostory команд в файл
#Get-History | Export-Clixml -Path $PathFolder"\TMP_History_PS.xml"    # Экспорт истории команд PS в формат XML