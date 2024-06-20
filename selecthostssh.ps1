function Select-SSHHost {
    $hosts = @(
        @{Option = 1; Name = "VMDev Casa"; Address = "10.144.10.3"; User = "thiago"; Key = "C:\Users\thiago.neves\.ssh\id_rsa-vscode-thiago_devCasa"},
        @{Option = 2; Name = "VMDev X Mold"; Address = "10.120.40.26"; User = "thiago"; Key = "C:\Users\thiago.neves\.ssh\id_rsa-vscode-thiago_dev"},
        @{Option = 3; Name = "CT Airflow"; Address = "10.120.40.23"; User = "airflow"; Key = "C:\Users\thiago.neves\.ssh\id_rsa-vscode-airflow"}
    )

    $hosts | ForEach-Object { Write-Host "$($_.Option): $($_.Name)" }

    $selection = Read-Host "Digite o nome do host que você deseja conectar"

    $selectedHost = $hosts | Where-Object { $_.Option -eq $selection }

    if ($null -ne $selectedHost) {
        $command = "ssh -i $($selectedHost.Key) $($selectedHost.User)@$($selectedHost.Address)"
        Write-Host "Conectando ao host: $($selectedHost.Name)"
        Invoke-Expression $command
    } else {
        Write-Host "Host não encontrado. Tente novamente."
    }
}