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
`$url64      = "https://github.com/gardener/gardenlogin/releases/download/$version/gardenlogin_windows_amd64.exe"
`$toolsDir   = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"

`$packageArgs = @{
  PackageName     = `$env:ChocolateyPackageName
  Url64bit        = `$url64
  ChecksumType64  = 'sha256'
  Checksum64      = "$checksum64"
  FileFullPath    = "`$toolsDir\gardenlogin.exe"
}
Get-ChocolateyWebFile @packageArgs
Install-BinFile -Name "kubectl-gardenlogin" -Path "`$toolsDir\gardenlogin.exe"

"@ > gardenlogin\tools\chocolateyinstall.ps1

@"	
Uninstall-BinFile -Name "kubectl-gardenlogin"
"@ > gardenlogin\tools\chocolateyuninstall.ps1

