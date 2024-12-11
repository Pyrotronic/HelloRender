

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app


COPY HelloRender/HelloRender.csproj ./HelloRender/


RUN dotnet restore HelloRender/HelloRender.csproj

COPY . .


RUN dotnet publish HelloRender/HelloRender.csproj -c Release -o /out


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /out ./

EXPOSE 80
ENTRYPOINT ["dotnet", "HelloRender.dll"]
