Write-Output "Downloading installer..."
$WebClient = New-Object System.Net.WebClient;
$WebClient.DownloadFile('https://download.microsoft.com/download/5/A/8/5A8B8314-CA70-4225-9AF0-9E957C9771F7/vs_BuildTools.exe', 'vs_BuildTools.exe');
Write-Output "Installing Visual Studio..."
Start-Process ./vs_BuildTools.exe -ArgumentList '--quiet', '--norestart', '--add', 'Microsoft.VisualStudio.Workload.VCTools' -Wait;
Write-Output "Removing installer..."
Remove-Item ./vs_BuildTools.exe
Write-Output "Finieshed."