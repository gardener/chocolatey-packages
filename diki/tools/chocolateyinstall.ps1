$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/diki/releases/download/v0.20.0/diki-windows-amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "51adfa8562f1e238b940ce38c8f42e44100ba277c2632438cb67e340f3f6da49"
  FileFullPath    = "$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
