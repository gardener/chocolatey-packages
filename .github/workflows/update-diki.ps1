# SPDX-FileCopyrightText: 2025 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0
Param(
  [Parameter(Mandatory=$true)]
  [string]$version,
  [Parameter(Mandatory=$true)]
  [string]$checksum64
)

@"	
`$ErrorActionPreference = 'Stop'
`$url64      = "https://github.com/gardener/diki/releases/download/$version/diki-windows-amd64.exe"
`$toolsDir   = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"

`$packageArgs = @{
  PackageName     = `$env:ChocolateyPackageName
  Url64bit        = `$url64
  ChecksumType64  = 'sha256'
  Checksum64      = "$checksum64"
  FileFullPath    = "`$toolsDir\diki.exe"
}
Get-ChocolateyWebFile @packageArgs
"@ > diki\tools\chocolateyinstall.ps1
