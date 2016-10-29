function Enable-PulsewayMaintenanceMode
{
    param
    (
        [string[]] $ComputerName
    )

    foreach ($Target in $ComputerName)
    {
        if (Test-PulsewayInstalled -ComputerName $Target)
        {
            Invoke-Command -ComputerName $Target -ScriptBlock {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\MMSOFT Design\PC Monitor" -Name 'MaintenanceMode' -Value 1 -Type String
            }
        }
        else
        {
            Write-Warning "No response from $Target"
        }
    }
}
