# Update and install any dependencies
Write-Output "Installing dependencies..."
# Add any necessary installation commands here

# Set up the build agent (customize as needed)
# Replace <AGENT_URL>, <AGENT_TOKEN>, <POOL_NAME>, and <AGENT_NAME> with your actual values
Write-Output "Configuring build agent..."
Invoke-WebRequest -Uri "https://vstsagentpackage.azureedge.net/agent/2.211.3/vsts-agent-win-x64-2.211.3.zip" -OutFile "agent.zip"
Expand-Archive -Path "agent.zip" -DestinationPath "vsts-agent"
Set-Location -Path "vsts-agent"
.\config.cmd --unattended --url https://dev.azure.com/TobiOderinde1/ --auth pat --token  --pool test_pool --agent swivel-agent

# Run the agent
Write-Output "Starting build agent..."
Start-Process -NoNewWindow -FilePath ".\run.cmd"
