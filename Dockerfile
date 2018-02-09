FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN $WebClient = New-Object System.Net.WebClient; \
    $Cookie = \"oraclelicense=accept-securebackup-cookie\";\
    $WebClient.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie);\
    $WebClient.DownloadFile('https://download.microsoft.com/download/5/A/8/5A8B8314-CA70-4225-9AF0-9E957C9771F7/vs_BuildTools.exe', 'vs_BuildTools.ex') ; \
    Start-Process .\vs_BuildTools.exe -ArgumentList '--quiet', '--norestart', '--add', 'Microsoft.VisualStudio.Workload.VCTools' -Wait; \
    $WebClient.DownloadFile('http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jre-9.0.1_windows-x64_bin.exe', 'jre-9.0.1_windows-x64_bin.exe') ; \
    Start-Process .\jre-9.0.1_windows-x64_bin.exe -ArgumentList '/s' -Wait ; \
    Remove-Item .\*.exe; \
    WebClient.DownloadFile(https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe, gitlab-runner.exe); \

# SHELL ["cmd.exe", "/s", "/c", "C:\\Program Files (x86)\\Microsoft Visual C++ Build Tools\\vcbuildtools.bat", "x86_amd64"]

WORKDIR /code

# ENTRYPOINT ["C:\\Program Files (x86)\\Microsoft Visual C++ Build Tools\\vcbuildtools.bat", "x86_amd64"]
CMD ["cmd"]
