$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/v2.1.0/gardenctl_v2_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = "80b141560e7cbfea62972cf362ec3e5abd55ba0347b1c9f08951ab89c05fa6c2"
  FileFullPath    = "$toolsDir\gardenctl-v2.exe"
}
Get-ChocolateyWebFile @packageArgs
