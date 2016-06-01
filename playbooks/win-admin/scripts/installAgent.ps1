$serviceName = "appdMachineAgent"

# verify if the service already exists, and if yes remove it first
if (Get-Service $serviceName -ErrorAction SilentlyContinue)
{
    "'$serviceName' exists already. Stopping."
    Stop-Service $serviceName
    "Waiting 3 seconds to allow existing service to stop."
    Start-Sleep -s 3
  
	# using WMI to remove Windows service because PowerShell does not have CmdLet for this
    $serviceToRemove = Get-WmiObject -Class Win32_Service -Filter "name='$serviceName'"

# Don't remove unless the path changes
#    $serviceToRemove.delete()
	
	"Waiting 5 seconds to allow service to be un-installed."
     Start-Sleep -s 5 
  
    "service removed"
}
else
{
	# just do nothing
    "service does not exist"
}

"Creating credentials"
# creating credentials which can be used to run my windows service
# Account needs to have logon as a service rights. 
$secpasswd = ConvertTo-SecureString "540T6un!" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential (".\Ansible", $secpasswd)
"installing service"
$binaryPath = "c:\programs\appd\windows\bin\MachineAgentService.exe"
# creating windows service using all provided parameters
New-Service -name $serviceName -binaryPathName $binaryPath -displayName $serviceName -startupType Automatic -credential $mycreds

"installation completed"
"Starting the service"
Start-Service $serviceName

"Done"
