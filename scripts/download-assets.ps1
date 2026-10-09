$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$images = Join-Path $root 'public\images'
New-Item -ItemType Directory -Force -Path $images | Out-Null

# Original certificate-gallery files published by Suraksha Dal Security Force.
$official = @(
  @{ Url = 'https://www.surakshadalsecurityforce.com/assets/img/gallery-1.jpg'; File = 'certificate-1.jpg' },
  @{ Url = 'https://www.surakshadalsecurityforce.com/assets/img/gallery-2.jpg'; File = 'certificate-2.jpg' },
  @{ Url = 'https://www.surakshadalsecurityforce.com/assets/img/gallery-3.jpg'; File = 'certificate-3.jpg' },
  @{ Url = 'https://www.surakshadalsecurityforce.com/assets/img/gallery-4.jpg'; File = 'certificate-4.jpg' },
  @{ Url = 'https://www.surakshadalsecurityforce.com/assets/img/gallery-5.jpg'; File = 'certificate-5.jpg' },
  @{ Url = 'https://www.surakshadalsecurityforce.com/certificates.pdf'; File = 'certificates.pdf' }
)
# Real photographs from established security-service websites. They are downloaded once into public/images;
# the React site itself references only local files. Confirm licensing/permission before commercial publication.
$photos = @(
  @{ Url = 'https://www.btsfpl.com/assets/img/services/electronic-security-services/01.jpg'; File = 'security-control-room.jpg' },
  @{ Url = 'https://www.getgi.com/images/about/aboutus1.jpg'; File = 'security-training.jpg' },
  @{ Url = 'https://www.bpsindia.in/assets/img/new/Residential-Security-Guards-Jaipur-with-cctv.jpg'; File = 'security-team.jpg' },
  @{ Url = 'https://crownsecuritysolutions.com/images/services/CCTV_Monitoring/1.webp'; File = 'security-officer.jpg' },
  @{ Url = 'https://kalingaservices.com/img/service6.png'; File = 'security-patrol.jpg' },
  @{ Url = 'https://assets.zyrosite.com/cdn-cgi/image/format%3Dauto%2Cw%3D1920%2Cfit%3Dcrop/dWxLlVXXp4Fx6ZZj/surveillance-1-Aq2GBDervQCx3EEQ.png'; File = 'security-teamwork.jpg' }
)
foreach ($asset in ($official + $photos)) {
  $target = Join-Path $images $asset.File
  try {
    Invoke-WebRequest -Uri $asset.Url -OutFile $target -UseBasicParsing
    Write-Host "Downloaded $($asset.File)"
  } catch {
    Write-Warning "Could not download $($asset.File): $($_.Exception.Message)"
  }
}
Write-Host "Finished. Check public/images and verify each asset before publishing."
