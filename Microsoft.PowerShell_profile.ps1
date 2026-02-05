Import-Module Terminal-Icons

oh-my-posh init pwsh --config $HOME\.config\oh-my-posh\oh-my-posh.bigsby.omp.json | Invoke-Expression

Set-Alias -Name lg -Value lazygit
Set-Alias -Name grep -Value findstr
Set-Alias -Name cat -Value bat -Option AllScope

Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineOption -PredictionViewStyle ListView 
Set-PSReadLineOption -EditMode Vi

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Invoke-Expression (& { (zoxide init powershell | Out-String) })

$env:YAZI_FILE_ONE="C:\Program Files\Git\usr\bin\file.exe"

function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe $args --cwd-file="$tmp"
	$cwd = Get-Content -Path $tmp -Encoding UTF8
	if ($cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
		Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
	}
	Remove-Item -Path $tmp
}
