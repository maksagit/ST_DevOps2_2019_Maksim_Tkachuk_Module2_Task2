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