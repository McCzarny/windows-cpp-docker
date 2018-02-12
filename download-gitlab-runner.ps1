Write-Output "Downloading git runner..."
Invoke-WebRequest -Uri 'https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe' -OutFile 'gitlab-runner.exe';
Write-Output "Finieshed."