# Stage 1: Build with .NET 6
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy project files first
COPY *.sln .
COPY QuantumAPI/*.csproj ./QuantumAPI/
COPY QuantumApp/*.csproj ./QuantumApp/

# Restore dependencies
RUN dotnet restore

# Copy everything else
COPY . ./

# Build & publish
RUN dotnet publish QuantumAPI/QuantumAPI.csproj -c Release -o out

# Stage 2: Runtime with .NET 6
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "QuantumAPI.dll"]
