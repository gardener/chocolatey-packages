$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/v2.1.1/gardenctl_v2_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "81c8f4e43527fec0849a3dbea003d2a1fd429c1d3f345606fdaa9e42500c69db"
  FileFullPath    = "$toolsDir\gardenctl-v2.exe"
}
Get-ChocolateyWebFile @packageArgs
