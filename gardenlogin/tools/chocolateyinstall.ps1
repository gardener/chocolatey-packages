$url64      = "https://github.com/grolu/gardenlogin/releases/download/$env:chocolateyPackageVersion/gardenlogin_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'md5'
  Checksum64      = 'e5570eb40a697aadba9ecdb7011e4c6b'
  FileFullPath    = "$toolsDir\gardenlogin.exe"
}

Get-ChocolateyWebFile @packageArgs