#dotnet tool install --global dotnet-sonarscanner
export DOTNET_ROOT=/usr/local/share/dotnet
dotnet sonarscanner begin /k:"demo_api" /d:sonar.host.url="http://143.198.206.159:9000" /d:sonar.token="sqa_bfaa863d170f81a7ecb4d1ef24d0ba0f681d8a3c"
dotnet build
dotnet sonarscanner end /d:sonar.token="sqa_bfaa863d170f81a7ecb4d1ef24d0ba0f681d8a3c"