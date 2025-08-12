$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenlogin/releases/download/v0.7.0/gardenlogin_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "a160e2d6aebb318684e6822a34c6b68aa98ddfaa75473ce8526d74c70ae5a93f"
  FileFullPath    = "$toolsDir\gardenlogin.exe"
}
Get-ChocolateyWebFile @packageArgs
Install-BinFile -Name "kubectl-gardenlogin" -Path "$toolsDir\gardenlogin.exe"

