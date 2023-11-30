# Working with .Net 8 ...

Build and Run
```
// Create webapi project
$dotnet new webapi

// Build image
$docker compose build

// Create container
$export API_PORT=8080
$docker compose up -d

$docker compose ps
$docker compose logs --follow

// Delete all containers
$docker compose down
```

Access URL in web browser
* http://localhost:8080/weatherforecast
* http://localhost:8080/swagger/index.html
