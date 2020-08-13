[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation
try 
{   
  Import-VstsLocStrings "$PSScriptRoot\Task.json"

  # Get task variables.
  [string]$AzskOutputFolder = Get-VstsInput -Name AzskOutputFolder
  [bool]$EnableExit = Get-VstsInput -Name EnableExit -AsBool

  Import-Module -name $PSScriptRoot\ps_modules\azskhelper\azskhelper.psd1 -verbose

  if (get-module -name 'azskhelper')
  {
    Write-Host 'azskhelper module loaded'

    if ($EnableExit)
    {
        Write-Verbose 'Publish-AzskSVTNUnit with Exit Enabled'
        Publish-AzskSVTNUnit -Path $AzskOutputFolder -EnableExit
    }
    else
    {
        Write-Verbose 'Publish-AzskSVTNUnit without Exit Enabled'
        Publish-AzskSVTNUnit -Path $AzskOutputFolder
    }
  }
  else
  {
    Write-Host "##vso[task.logissue type=error;]Unable to load azskhelper module"
  }
}
finally 
{
  Trace-VstsLeavingInvocation $MyInvocation
}