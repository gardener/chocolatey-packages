$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/diki/releases/download/v0.15.1/diki-windows-amd64"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "e64245fdbc7dfb1b8f19f868b81c5acaf0d7fd60a73aa3cc042b0722c9b660f9"
  FileFullPath    = "$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
