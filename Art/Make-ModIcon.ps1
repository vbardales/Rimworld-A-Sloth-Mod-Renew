# About/ModIcon.png: the generated mascot head, reduced to the 128x128 the game expects.
#
# The render arrives at 1254x1254 and 1.2 MB. Steam publishes the mod folder as it stands -
# SetItemContent takes RootDir with no filtering - so shipping the full render would push that
# megabyte into every subscriber's install for an image the mod list draws at 32 px. The source
# stays here in Art/, outside Mod/, and never gets published.
Add-Type -AssemblyName System.Drawing
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $here 'ModIcon-source.png'
$dst  = Join-Path $here '..\Mod\About\ModIcon.png'
$bmp = [System.Drawing.Bitmap]::FromFile($src)
$out = New-Object System.Drawing.Bitmap 128,128,([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g = [System.Drawing.Graphics]::FromImage($out)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.Clear([System.Drawing.Color]::Transparent)
$g.DrawImage($bmp,(New-Object System.Drawing.Rectangle 0,0,128,128),(New-Object System.Drawing.Rectangle 0,0,$bmp.Width,$bmp.Height),[System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose(); $out.Save($dst,[System.Drawing.Imaging.ImageFormat]::Png); $out.Dispose(); $bmp.Dispose()
"{0} : {1} bytes" -f (Resolve-Path $dst), (Get-Item $dst).Length
