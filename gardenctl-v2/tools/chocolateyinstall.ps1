$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/v2.15.0/gardenctl_v2_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "3cb640f9fa72118f53726e33da78aedbd3e7d72214bfd08f0832e92ab27621fa"
  FileFullPath    = "$toolsDir\gardenctl.exe"
}
Get-ChocolateyWebFile @packageArgs
