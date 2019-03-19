param
(
    [string]
    $Source,
    [string]
    $Archive,
    [string]
    $FileExtension,
    [switch]
    $Clean,
    [switch]
    $UseProxy
)

$moduleFolder = "$pwd\modules"

Write-Host ('Loading WarHelper module from {0}' -f $moduleFolder)
Import-Module $moduleFolder\WarHelper\WarHelper.psd1 -verbose

if (get-module -name 'WarHelper')
{
  Write-Host 'WarHelper module loaded'

  if ($UseProxy)
  {
      Write-Host 'Using Proxy for PowerShell'
      [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials 
  }

  Azsk-NUnit -Source $Source -Archive $Archive -Extension $FileExtension -Clean:$Clean
}
else
{
      Write-Host "##vso[task.logissue type=error;]Unable to load WarHelper module"
}
