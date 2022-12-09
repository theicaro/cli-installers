#"starting to install Icaro!"
#
#$JavaVersion = 0
#
#try
#{
#    $JavaVersion = [int](Get-Command java | Select-Object -ExpandProperty Version | Select-Object -ExpandProperty Major)
#}
#catch
#{
#    throw "java 11+ is required to install Icaro!"
#}
#
#if ($JavaVersion -lt 11)
#{
#    throw "Error: the java version in use should be 11+, current: $JavaVersion"
#}
#
#Get-ChildItem -Path ~/icaro -Recurse | Remove-Item -force -recurse
#Remove-Item ~/icaro -ErrorAction SilentlyContinue
#New-Item -Path '~/icaro/lang' -ItemType Directory
#New-Item -Path '~/icaro/cli/core' -ItemType Directory
#
#$profilePath = $profile.CurrentUserAllHosts
#if (!(Test-Path $profilePath))
#{
#    New-Item -ItemType File -Path $profilePath -Force
#}
#Add-Content -Path ~/icaro/env.ps1 -Value "`$env:ICARO_HOME = `"~/icaro`""
#Add-Content -Path ~/icaro/env.ps1 -Value "New-Alias -Name `'icaro`' -Value `'java -jar ~/icaro/cli/entrypoint.jar`'"

#$stringToSearch = "search string"
#$filePath = "C:\path\to\file.ps1"
#
#$result = Select-String -Path $filePath -Pattern $stringToSearch -Quiet
#
#if ($result) {
#    Write-Host "The string was found in the file."
#} else {
#    Write-Host "The string was not found in the file."
#}


# if not present {
# Add-Content -Path $profilePath -Value ". ~/icaro/env.ps1"
#
# }
#. $profilePath
#
#Invoke-WebRequest -Verbose -Uri "https://github.com/icaroland/cli-entrypoint/releases/latest/download/entrypoint.jar" -OutFile "~/icaro/cli/entrypoint.jar"
#

$lastCliCoreVersion = ""

try
{
    $lastCliCoreUrl = (Invoke-WebRequest -Uri "https://github.com/icaroland/cli-core/releases/latest" -MaximumRedirection 0 -ErrorAction:SilentlyContinue).Headers.Location
    $lastCliCoreVersion = Split-Path -Path $lastCliCoreUrl -Leaf
}
catch
{
    $lastCliCoreVersion = Split-Path -Path $_.Exception.Response.Headers.Location -Leaf
}

"https://github.com/icaroland/cli-core/releases/download/$lastCliCoreVersion/$lastCliCoreVersion.jar"

#Invoke-WebRequest -Verbose -Uri "https://github.com/icaroland/cli-core/releases/download/$lastCliCoreVersion/$lastCliCoreVersion.jar" -OutFile "~/icaro/cli/core/$lastCliCoreVersion.jar"
#
#
#Get-ChildItem -Path '~/icaro' -Recurse | Format-List -Property FullName
