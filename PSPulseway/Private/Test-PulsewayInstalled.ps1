function Test-PulsewayInstalled
{
    param
    (
        [string[]] $ComputerName
    )

    foreach ($Target in $ComputerName)
    {
        $PulsewayDirs = @(
            "\\$Target\c$\Program Files\PC Monitor\",
            "\\$Target\c$\Program Files (x86)\PC Monitor\",
            "\\$Target\c$\Program Files\Pulseway\",
            "\\$Target\c$\Program Files(x86)\Pulseway\"
        )
    
        if (Test-Connection -ComputerName $Target -Count 1 -Quiet)
        {
            if (Test-Path -Path $PulsewayDirs)
            {
                $true
            }
            else
            {
                $false
            }
        }
        else
        {
            $false
        }
    }
}
