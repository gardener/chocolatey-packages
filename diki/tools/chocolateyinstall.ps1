$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/diki/releases/download/v0.21.1/diki-windows-amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "898f87c1c07cc793752511cdd3243617894f559173869f6c70be9e495efb841e"
  FileFullPath    = "$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
