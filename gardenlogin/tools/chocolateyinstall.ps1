$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/grolu/gardenlogin/releases/download/$env:chocolateyPackageVersion/gardenlogin_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum64 = Get-Content "$toolsDir\checksum64.txt" -First 1

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = $checksum64
  FileFullPath    = "$toolsDir\gardenlogin.exe"
}

Get-ChocolateyWebFile @packageArgs