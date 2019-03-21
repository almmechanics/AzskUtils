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

  Publish-AzskNUnit -AzskOutputFolder $AzskOutputFolder -EnableExit:$EnableExit
}
else
{
  Write-Host "##vso[task.logissue type=error;]Unable to load azskhelper module"
}
