Import-Module PSReadLine

# Prompt
Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config $HOME/mb.omp.json | Invoke-Expression
# Set-PoshPrompt -Theme paradox

# Alias
Set-Alias vim nvim
Set-Alias grep findstr

# Functions
function touch {
    Param(
      [Parameter(Mandatory=$true)]
      [string]$Path
    )
  
    if (Test-Path -LiteralPath $Path) {
      (Get-Item -Path $Path).LastWriteTime = Get-Date
    } else {
      New-Item -Type File -Path $Path
    }
  }

function which($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue | 
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
