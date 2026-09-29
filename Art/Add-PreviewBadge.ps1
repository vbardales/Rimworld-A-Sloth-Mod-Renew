param(
    [string]$Preview = (Join-Path $PSScriptRoot '../Mod/About/Preview.png'),
    [string]$Icon = (Join-Path $PSScriptRoot '../Mod/About/ModIcon.png'),
    [string]$SourceOut = (Join-Path $PSScriptRoot 'Preview.png'),
    [ValidateSet('left', 'right')][string]$Corner = 'right',
    [int]$BadgeSize = 160,
    [int]$Margin = 24
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

if (-not (Test-Path $SourceOut)) {
    Copy-Item $Preview $SourceOut
}

$base = [System.Drawing.Image]::FromFile($Preview)
$bmp = New-Object System.Drawing.Bitmap $base.Width, $base.Height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'AntiAlias'
$g.InterpolationMode = 'HighQualityBicubic'
$g.PixelOffsetMode = 'HighQuality'
$g.DrawImage($base, 0, 0, $base.Width, $base.Height)
$base.Dispose()

$iconImg = [System.Drawing.Image]::FromFile($Icon)
$angle = if ($Corner -eq 'left') { 15 } else { -15 }
$cx = if ($Corner -eq 'left') { $Margin + $BadgeSize / 2 } else { $bmp.Width - $Margin - $BadgeSize / 2 }
$cy = $bmp.Height - $Margin - $BadgeSize / 2

$g.TranslateTransform([single]$cx, [single]$cy)
$g.RotateTransform([single]$angle)
$destRect = New-Object System.Drawing.Rectangle ([int](-$BadgeSize / 2)), ([int](-$BadgeSize / 2)), $BadgeSize, $BadgeSize
$g.DrawImage($iconImg, $destRect)
$g.ResetTransform()
$iconImg.Dispose()
$g.Dispose()

$bmp.Save($Preview, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Output "Badged $Preview ($Corner, $angle deg); source kept at $SourceOut"
