var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

string port = Environment.GetEnvironmentVariable("PORT") ?? "5000";
app.Urls.Add($"http://*:{port}");

app.MapGet("/", () => "Hello, Render!");

app.Run();
