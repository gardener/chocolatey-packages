# SPDX-FileCopyrightText: 2021 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenlogin/releases/download/$env:chocolateyPackageVersion/gardenlogin_windows_amd64.exe"
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
