# Используем официальный образ для ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Строим приложение
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["HelloRender.csproj", "./"]
RUN dotnet restore "HelloRender.csproj"
COPY . .
RUN dotnet publish "HelloRender.csproj" -c Release -o /app/publish

# Копируем сборку
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "HelloRender.dll"]
