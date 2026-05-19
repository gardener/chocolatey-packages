$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenlogin/releases/download/v0.10.0/gardenlogin_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "8977cd7f21ae85c8588b33c3196b3e59a3086432656cb5f4d87e5c0002002ac5"
  FileFullPath    = "$toolsDir\gardenlogin.exe"
}
Get-ChocolateyWebFile @packageArgs
Install-BinFile -Name "kubectl-gardenlogin" -Path "$toolsDir\gardenlogin.exe"

