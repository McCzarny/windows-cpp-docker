$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession;
$oracle_cookie = New-Object System.Net.Cookie ;
$oracle_cookie.Name = "oraclelicense";
$oracle_cookie.Value = "accept-securebackup-cookie";
$oracle_cookie.Domain = ".oracle.com";
$session.Cookies.Add($oracle_cookie);
Write-Output "Downloading JRE..."
Invoke-WebRequest -Uri 'http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jre-9.0.4_windows-x64_bin.exe' -WebSession $session -OutFile 'jre_windows-x64_bin.exe'
Write-Output "Installing JRE..."
Start-Process ./jre_windows-x64_bin.exe -ArgumentList '/s' -Wait;
Write-Output "Removing installation package"
#Remove-Item ./jre_windows-x64_bin.exe
Write-Output "Finieshed."
