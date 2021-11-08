# SPDX-FileCopyrightText: 2021 SAP SE or an SAP affiliate company and Gardener contributors
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
`$url64      = "https://github.com/gardener/gardenctl-v2/releases/download/$version/gardenctl_v2_windows_amd64.exe"
`$toolsDir   = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"

`$packageArgs = @{
  PackageName     = `$env:ChocolateyPackageName
  Url64bit        = `$url64
  ChecksumType64  = 'sha256'
  Checksum64      = "$checksum64"
  FileFullPath    = "`$toolsDir\gardenctl-v2.exe"
}
Get-ChocolateyWebFile @packageArgs
"@ > gardenctl-v2\tools\chocolateyinstall.ps1
