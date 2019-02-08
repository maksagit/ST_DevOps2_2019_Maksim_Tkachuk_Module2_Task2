### 11.	Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой 
### записи, в виде 5 любых (выбранных Вами) свойств.
Get-Content $PathFolder"\TMP_History_PS.xml" | Select-Object Length, ReadCount, PSChildName, PSDrive, PSPath
###
Remove-Item $PathFolder -Recurse                                # Удаление папки