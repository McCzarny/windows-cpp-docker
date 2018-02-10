FROM microsoft/windowsservercore

ADD *.ps1 ./
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN ./install-vs.ps1; \
    ./install-java.ps1; \
    ./download-gitlab-runner.ps1;

# SHELL ["cmd.exe", "/s", "/c", "C:\\Program Files (x86)\\Microsoft Visual C++ Build Tools\\vcbuildtools.bat", "x86_amd64"]

WORKDIR /code

# ENTRYPOINT ["C:\\Program Files (x86)\\Microsoft Visual C++ Build Tools\\vcbuildtools.bat", "x86_amd64"]
#CMD ["powershell"]
