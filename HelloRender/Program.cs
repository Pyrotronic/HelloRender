var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

string port = Environment.GetEnvironmentVariable("PORT") ?? "10000";
app.Urls.Add($"http://*:{port}");

app.MapGet("/", () => "Hello, Render!");

app.Run();
