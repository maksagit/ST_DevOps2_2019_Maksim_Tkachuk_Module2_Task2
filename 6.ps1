### 6. Вывести список из 6 процессов занимающих дольше всего процессор.
Get-Process | Sort-Object UserProcessorTime -Descending -ErrorAction SilentlyContinue | `
Select-Object Name, VM, Id, UserProcessorTime -First 6