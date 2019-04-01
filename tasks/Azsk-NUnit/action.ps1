param
(
    [string]
    $AzskOutputFolder,
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
      Write-Verbose 'Publish-AzskNUnit with Exit Enabled'
      Publish-AzskNUnit -Path $AzskOutputFolder -EnableExit
  }
  else
  {
      Write-Verbose 'Publish-AzskNUnit without Exit Enabled'
      Publish-AzskNUnit -Path $AzskOutputFolder
  }
}
else
{
  Write-Host "##vso[task.logissue type=error;]Unable to load azskhelper module"
}
