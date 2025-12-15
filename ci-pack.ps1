param(
  [Parameter(Mandatory = $true, Position = 0)]
  [string]$Version
)

dotnet clean -c Release

$repositoryUrl = "https://github.com/$env:GITHUB_REPOSITORY"

# Building for packing and publishing.
dotnet pack -c Release -p:PackageOutputPath="$PSScriptRoot/artifacts" -p:RepositoryUrl=$repositoryUrl -p:MinVerVersionOverride=$Version
