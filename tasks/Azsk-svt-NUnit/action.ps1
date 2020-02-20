param
(
    [string]
    $AzskOutputFolder,
    [string]
    $OutputVariable,
    [string]
    $EnableExit
)

$moduleFolder = "$pwd\modules"

Write-Host ('Loading azskhelper module from {0}' -f $moduleFolder)
Import-Module $moduleFolder\azskhelper\azskhelper.psd1 -verbose

if (get-module -name 'azskhelper')
{
  Write-Host 'azskhelper module loaded'

  if ($EnableExit -eq [bool]::TrueString)
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
