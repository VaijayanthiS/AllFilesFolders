

Start-Service WinRM

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 104.40.10.247

Connect-AzureRmAccount

Get-AzureRmNetworkSecurityGroup -Name AzureVM-nsg -ResourceGroupName Vaijayanthi | Add-AzureRmNetworkSecurityRuleConfig -Name AllowingWinRMHTTPS -Description "To Enable PowerShell Remote Access" -Access Allow -Protocol Tcp -Direction Inbound -Priority 102 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * DestinationPortRange * | Set-AzureRmNetworkSecurityGroup
Get-AzureRmNetworkSecurityGroup -Name AzureVM-nsg -ResourceGroupName Vaijayanthi | Add-AzureRmNetworkSecurityRuleConfig -Name AllowingWinRMHTTP -Description "To Enable PowerShell Remote Access" -Access Allow -Protocol Tcp -Direction Inbound -Priority 103 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix *  DestinationPortRange * | Set-AzureRmNetworkSecurityGroup


Enter-PSSession -ComputerName 104.40.10.247




$server = "104.40.10.247"
$matchingWord = "disc"

$sessions = ((quser /server:$server | ? {$_ -match $matchingWord}) -split ' +')
$cycle = $sessions.count / 8
$count = 2

For ($i=0; $i -lt $cycle; $i++)
{
	logoff $sessions[$count] /server:$server
	$count = $count + 8
}