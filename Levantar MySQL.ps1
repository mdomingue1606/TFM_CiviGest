# start-mysql.ps1

# Cambia el nombre del servicio si el tuyo es diferente
$serviceName = "MySQL80"

Write-Host "Intentando arrancar el servicio MySQL: $serviceName ..."
Start-Service -Name $serviceName

# Espera un poco y muestra el estado
Start-Sleep -Seconds 2
Get-Service -Name $serviceName | Format-Table Status, Name, DisplayName
