$WebClient = New-Object System.Net.WebClient;
$Cookie = "oraclelicense=accept-securebackup-cookie";
$WebClient.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie);
Write-Output "Downloading JRE..."
$WebClient.DownloadFile('http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jre-9.0.4_windows-x64_bin.exe', 'jre_windows-x64_bin.exe') ;
Write-Output "Installing JRE..."
Start-Process ./jre_windows-x64_bin.exe -ArgumentList '/s' -Wait;
Write-Output "Removing installation package"
Remove-Item ./jre_windows-x64_bin.exe
Write-Output "Finieshed."