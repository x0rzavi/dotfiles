param(
    [Parameter(Mandatory=$true)]
    [string]$Directory
)

# Check if directory argument is provided
if ([string]::IsNullOrEmpty($Directory)) {
    Write-Host "Usage: .\compress_images.ps1 <directory>"
    exit 1
}

# Check if directory exists
if (!(Test-Path -Path $Directory -PathType Container)) {
    Write-Host "Error: Directory '$Directory' does not exist"
    exit 1
}

# Find image files and process them
Get-ChildItem -Path $Directory -Recurse -Include *.jpg, *.jpeg, *.png | ForEach-Object {
    $file = $_.FullName
    
    try {
        # Use file utility to check MIME type (equivalent to: file -b --mime-type)
        $mimeType = & file -b --mime-type $file 2>$null
        
        if ($mimeType -notmatch "^image/avif") {
            # Run avifenc (equivalent to: avifenc --jobs all "{}" "{}")
            $result = & avifenc --jobs all $file $file 2>&1
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "Processed: $file"
            } else {
                Write-Host "Failed: $file"
            }
        }
        # Uncomment to show skipped files
        else {
            Write-Host "Skipped: $file"
        }
    }
    catch {
        Write-Host "Failed: $file"
    }
}
