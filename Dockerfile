# Используем образ .NET SDK для сборки
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Копируем файл проекта
COPY HelloRender/HelloRender.csproj ./HelloRender/

# Восстанавливаем зависимости
RUN dotnet restore HelloRender/HelloRender.csproj

# Копируем все исходники
COPY . .

# Собираем и публикуем проект
RUN dotnet publish HelloRender/HelloRender.csproj -c Release -o /out

# Используем ASP.NET Core образ для запуска
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
WORKDIR /app
COPY --from=build /out ./

EXPOSE 80
ENTRYPOINT ["dotnet", "HelloRender.dll"]
