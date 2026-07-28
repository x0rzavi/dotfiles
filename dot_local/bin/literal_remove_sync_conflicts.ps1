param(
    [Parameter(Mandatory=$true)]
    [string]$Directory
)

# Check if directory argument is provided
if ([string]::IsNullOrEmpty($Directory)) {
    Write-Host "Usage: .\remove_sync_conflicts_native.ps1 <directory>" -ForegroundColor Red
    exit 1
}

# Check if directory exists
if (!(Test-Path -Path $Directory -PathType Container)) {
    Write-Host "Error: Directory '$Directory' does not exist" -ForegroundColor Red
    exit 1
}

# Find sync-conflict files (equivalent to fd -H -a -t f --glob "*.sync-conflict*")
$conflictFiles = Get-ChildItem -Path $Directory -Recurse -Force -File | Where-Object { $_.Name -like "*sync-conflict*" }
$conflictCount = ($conflictFiles | Measure-Object).Count

if ($conflictCount -eq 0) {
    Write-Host "No sync-conflict files found in: $Directory" -ForegroundColor Green
    exit 0
}

Write-Host "Found $conflictCount sync-conflict files in: $Directory" -ForegroundColor Yellow
Write-Host "Files to be removed:" -ForegroundColor Yellow
$conflictFiles | ForEach-Object { Write-Host $_.FullName -ForegroundColor Cyan }

# Prompt for confirmation
Write-Host ""
$response = Read-Host "Do you want to remove all these files? (y/N)"

if ($response -match "^[Yy]$") {
    $removedCount = 0
    $failedCount = 0
    
    $conflictFiles | ForEach-Object {
        try {
            Remove-Item $_.FullName -Force
            Write-Host "Removed: $($_.FullName)" -ForegroundColor Green
            $script:removedCount++
        }
        catch {
            Write-Host "Failed to remove: $($_.FullName)" -ForegroundColor Red
            $script:failedCount++
        }
    }
    
    Write-Host "`nSync-conflict cleanup completed!" -ForegroundColor Green
    Write-Host "Removed: $removedCount files" -ForegroundColor Green
    if ($failedCount -gt 0) {
        Write-Host "Failed: $failedCount files" -ForegroundColor Red
    }
}
else {
    Write-Host "Operation cancelled." -ForegroundColor Yellow
}
