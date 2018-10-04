function Get-Uptime
{
    param(
    [String[]]
    $ComputerName
    )
    process {

    if($ComputerName)
        {
        	$OperatingSystem = Get-WmiObject Win32_OperatingSystem -ComputerName $ComputerName
        }
    else
        {
            $OperatingSystem = Get-WmiObject Win32_OperatingSystem
        }
    
    $LastBoot = $OperatingSystem.ConvertToDateTime($OperatingSystem.LastBootupTime)

    $UpTime = (get-date).subtract(
            $OperatingSystem.ConvertToDateTime(
            $OperatingSystem.LastBootUpTime)
        )

    "Last boot: {0}" -f $LastBoot
    "Uptime: {0}d {1}h {2}m {3}s" -f 
        $UpTime.days, 
        $UpTime.hours, 
        $UpTime.minutes, 
        $UpTime.seconds
    }
}