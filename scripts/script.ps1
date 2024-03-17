function Dict-Init {
    if(!(Test-Path "./words") -and !(Test-Path "./conjugations")){
        Write-Output "Creating Direvtories..."
        New-Item -ItemType Directory -Path "./words" 
        New-Item -ItemType File -Path "./words/words.txt" 
        New-Item -ItemType Directory -Path "./conjugations" 
    } else {
        Write-Output "Directories already exist"
    }
}

function Dict-Add {
    param(
        [Parameter(Mandatory)]
        [string]$word
    )

    $vocab = Get-Content "./words/words.txt"
    foreach($term in $vocab){
        if(!($word -eq $term)){
            Write-Output "Added $word to vocabulary list!"
            Add-Content -Path "./words/words.txt" -Value $word
        } else {
            Write-Output "$word already exists in Dictionary!"
        }
    }

}