$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/v2.7.0/gardenctl_v2_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "1487343d7918b4186f962f10efec0e3caf77314fd2237629ff69e21de9f715da"
  FileFullPath    = "$toolsDir\gardenctl.exe"
}
Get-ChocolateyWebFile @packageArgs
