# SPDX-FileCopyrightText: 2021 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop'
$url64      = "https://github.com/gardener/gardenlogin/releases/download/0.0.0/gardenlogin_windows_amd64.exe"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  Url64bit        = $url64
  ChecksumType64  = 'sha256'
  Checksum64      = ""
  FileFullPath    = "$toolsDir\gardenlogin.exe"
}

Get-ChocolateyWebFile @packageArgs
