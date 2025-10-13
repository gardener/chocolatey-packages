$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/diki/releases/download/v0.21.0/diki-windows-amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "83942c75bf5b86847b6adf0e8d64f3e25044177f9ef9b1f441fcd51dbd1bd8ee"
  FileFullPath    = "$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
