<#
.SYNOPSIS
    Toggle touch screen
.DESCRIPTION
    The script toggles your touch screen depending on the current status
    turns touch screen OFF if ON and vice versa.
	To make this script available to run as a cmd add the following to your powershell $PROFILE file.
	Set-Alias <your alias>  <path to this script>
	Note: Need to be in Administrator mode for script to work.
.NOTES
    File Name      : Toggle-Touch.ps1
    Author         : Hasan Rizvi (hasangr8@gmail.com)
.LINK
    Script posted over:
    https://github.com/hizvi/useful_scripts
.EXAMPLE
    Toggle-Touch.ps1
#>


Function Toggle-Touch
{
	# get touch screen object 
	$screen = Get-PnpDevice | Where-Object {$_.FriendlyName -like '*touch screen*'}

	# take appropriate action depending on current status
	If ($screen.Status -eq 'OK')
	{
		Disable-PnpDevice -InputObject:$screen -Confirm:$false
		# Write-Output 'Touch Disabled'
	}
	Else
	{
		Enable-PnpDevice -InputObject:$screen -Confirm:$false 
		# Write-Output 'Touch Enabled'
	}

}

Toggle-Touch
