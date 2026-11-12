$backend = Join-Path $PSScriptRoot '..\IdleCapital\IdleCapital'
$frontend = $PSScriptRoot

Start-Process powershell -ArgumentList @(
    '-NoExit',
    '-Command',
    "Set-Location '$backend'; dotnet run --launch-profile https"
)

Start-Process powershell -ArgumentList @(
    '-NoExit',
    '-Command',
    "Set-Location '$frontend'; python -m http.server 5500"
)

Start-Sleep -Seconds 3
Start-Process 'http://localhost:5500/login/login.html'