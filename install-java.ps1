Write-Output "Installing JRE..."
$WebClient = New-Object System.Net.WebClient;
$Cookie = \"oraclelicense=accept-securebackup-cookie\";
$WebClient.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie);
$WebClient.DownloadFile('http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jre-9.0.4_windows-x64_bin.exe', 'jre_windows-x64_bin.exe') ;
Start-Process ./jre_windows-x64_bin.exe -ArgumentList '/s' -Wait;
Remove-Item ./jre_windows-x64_bin.exe
Write-Output "Finieshed."