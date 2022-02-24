$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/v2.0.0/gardenctl_v2_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "e94639f849b4e4678b80af0b8b86fa208f20dd0556302eae9e9cc704ba5884c2"
  FileFullPath    = "$toolsDir\gardenctl-v2.exe"
}
Get-ChocolateyWebFile @packageArgs
