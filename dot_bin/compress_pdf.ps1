param(
    [Parameter(Mandatory=$true)]
    [string]$Directory
)

# Check if directory argument is provided
if ([string]::IsNullOrEmpty($Directory)) {
    Write-Host "Usage: .\compress_pdf.ps1 <directory>"
    exit 1
}

# Check if directory exists
if (!(Test-Path -Path $Directory -PathType Container)) {
    Write-Host "Error: Directory '$Directory' does not exist"
    exit 1
}

# Find PDF files and process them
Get-ChildItem -Path $Directory -Recurse -Include *.pdf | ForEach-Object {
    $file = $_.FullName
    $fileName = $_.Name
    $tempFile = "$env:TEMP\temp_$fileName"
    
    try {
        # Check if file was already processed by looking for Ghostscript in metadata
        $pdfInfo = & pdfinfo $file 2>$null
        
        if ($LASTEXITCODE -eq 0 -and $pdfInfo -match "Producer.*Ghostscript") {
            Write-Host "Skipped: $file (already optimized)"
        }
        else {
            # Run Ghostscript to compress PDF
            $gsResult = & gs -sDEVICE=pdfwrite -dCompatibilityLevel="1.4" -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$tempFile" "$file" 2>&1
            
            if ($LASTEXITCODE -eq 0 -and (Test-Path $tempFile)) {
                # Move temp file to replace original
                Move-Item -Path $tempFile -Destination $file -Force
                Write-Host "Processed: $file"
            }
            else {
                Write-Host "Failed: $file"
                # Clean up temp file if it exists
                if (Test-Path $tempFile) {
                    Remove-Item $tempFile -Force
                }
            }
        }
    }
    catch {
        Write-Host "Failed: $file - Exception: $($_.Exception.Message)"
        # Clean up temp file if it exists
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
        }
    }
}
