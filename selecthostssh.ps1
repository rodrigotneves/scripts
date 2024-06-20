function ConnectToHost {
    $hosts = @(
        @{Option = 1; Name = "CHANGE_HOST_NAME"; Address = "CHANGE_IP"; User = "CHANGE_USER"; Key = "PATH_TO_SSH_KEY"},
        @{Option = 2; Name = "CHANGE_HOST_NAME"; Address = "CHANGE_IP"; User = "CHANGE_USER"; Key = "PATH_TO_SSH_KEY"},
        @{Option = 3; Name = "CHANGE_HOST_NAME"; Address = "CHANGE_IP"; User = "CHANGE_USER"; Key = "PATH_TO_SSH_KEY"}
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