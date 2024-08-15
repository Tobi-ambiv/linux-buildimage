# Use the Windows Server Core image with .NET Runtime
FROM mcr.microsoft.com/dotnet/runtime:8.0-windowsservercore-ltsc2022 AS base

# Install any additional dependencies needed for your build agent
RUN powershell -Command \
    Install-WindowsFeature -Name Web-Server

# Create a directory for the build agent
WORKDIR C:\buildagent

# Copy the entry point script into the container
COPY configure-agent.ps1 .

# Set the entry point to the script
ENTRYPOINT ["powershell.exe", "./configure-agent.ps1"]
