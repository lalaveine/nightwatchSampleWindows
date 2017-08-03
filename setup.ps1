# Remove .git folder
Remove-Item .\.git\ -recurse -force

# Create directories
New-Item .\Drivers, .\Logs, .\Logs\Selenium, .\Output -type directory

# Define .NET WebClient for downloading all drivers
$webClient = New-Object System.Net.WebClient
$invocationPath = (Get-Item -Path ".\" -Verbose).FullName

# Download selenium standalone server
$url = 'https://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar'
$outfile = $invocationPath + '\Drivers\selenium-server.jar'
Write-Output 'Downloading Selenium Server...'
$webClient.DownloadFile($url, $outfile)

# Install chromedriver
$url = 'https://chromedriver.storage.googleapis.com/2.31/chromedriver_win32.zip'
$outfile = $invocationPath + '\chromedriver_win32.zip'
Write-Output 'Downloading chromedriver archive...'
$webClient.DownloadFile($url, $outfile)
# For this command PowerShell v5 is required
# Use $PSVersionTable.PSVersion to determine what version of PowerShell you are running
Write-Output 'Extracting chromedriver archive...'
Expand-Archive $outfile -DestinationPath .\Drivers\
Write-Output 'Removing chromedriver archive...'
Remove-Item $outfile

# Install geckodriver(firefox)

$url = 'https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win32.zip'
$outfile = $invocationPath + '\geckodriver-v0.18.0-win32.zip'
Write-Output 'Downloading geckodriver archive...'
$webClient.DownloadFile($url, $outfile)

# For this command PowerShell v5 is required
# Use $PSVersionTable.PSVersion to determine what version of PowerShell you are running
Write-Output 'Extracting geckodriver archive...'
Expand-Archive $outfile -DestinationPath .\Drivers\
Write-Output 'Removing geckodriver archive...'
Remove-Item $outfile

# Install driver for Microsoft Edge
$url = 'https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe'
$outfile = $invocationPath + '\Drivers\MicrosoftWebDriver.exe'
Write-Output 'Downloading Microsoft Web Driver...'
$webClient.DownloadFile($url, $outfile)

# Install nightwatch.js
npm install
