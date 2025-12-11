$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/diki/releases/download/v0.22.0/diki-windows-amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "9eda13e2c6e735a48502f7b7d7d033b670be48da1815bd1c099560a4d360f8b1"
  FileFullPath    = "$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
