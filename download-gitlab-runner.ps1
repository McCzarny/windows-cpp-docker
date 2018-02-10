$WebClient = New-Object System.Net.WebClient;
$WebClient.DownloadFile('https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe', 'gitlab-runner.exe');