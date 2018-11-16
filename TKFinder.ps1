# Developed by SnazzyDuckling #
###############################
If(!(test-path $PSScriptRoot\Data))
{
      New-Item -ItemType Directory -Force -Path $PSScriptRoot\Data
}
$Date = Get-Date -format "dd-MM-yyyy_HH-mm-ss"
Copy-Item -Path $PSScriptRoot\Data\*.txt -Recurse (New-Item "$PSScriptRoot\Backup\Backup_$Date" -Type container -Force)
Remove-Item -Path $PSScriptRoot\Data\*.txt -Force
    Clear-Host
do {
  do {
    Write-Host ""
    Write-Host "================ 'Game Selection' ================" -ForegroundColor Green

    Write-Host "1: Press '1' to select Squad search." -ForegroundColor White
    Write-Host "2: Press '2' to select Post Scriptum search." -ForegroundColor White
    Write-Host "Q: Press 'Q' to quit." -ForegroundColor White
    Write-Host ""
    Write-Host -nonewline "Type your choice and press Enter: " -ForegroundColor White
    $gameChoice = Read-Host
    cls
   $ok = $gameChoice -match '^[12q]+$'   
        if ( -not $ok) { write-host "Invalid selection" }
    } until ( $ok )
switch -Regex ( $gameChoice ) {
        "1"
        {
            cls
            Write-Host "Name needs to be 100% accurate to work properly" -ForegroundColor Green
            Write-Host ""
            Write-Host "Please enter Username below" -ForegroundColor White
            $offender = Read-Host
            Write-Host ""
            Write-Host "Working please wait..." -ForegroundColor White

            Get-Content C:\Users\hhc\Documents\TKS\Squad*.log | Select-String -SimpleMatch -Pattern "from $offender caused by" -Context 1, 3 | % { $_.context.PreContext + $_.line + $_.Context.PostContext } |  out-file "$PSScriptRoot\Data\FilterPass1.txt" -Force
            $Pattern = "from $offender caused by|TeamKilled"
            Get-Content "$PSScriptRoot\Data\FilterPass1.txt" | Where-Object { $_ -match $Pattern } | Set-Content "$PSScriptRoot\Data\FilterPass2.txt" -Force
            $PatternFinal = "Teamkilled $offender"
            Get-Content "$PSScriptRoot\Data\FilterPass2.txt" | Where-Object { $_ -notmatch $PatternFinal } | Set-Content "$PSScriptRoot\Data\FilterPass3.txt" -Force
            $Pattern = "TeamKilled"
            Get-Content "$PSScriptRoot\Data\FilterPass3.txt" | Where-Object { $_ -match $Pattern } | Out-File "$PSScriptRoot\Data\TeamkillPass1.txt" -Force
            $hash = @{}
            get-content "$PSScriptRoot\Data\TeamkillPass1.txt" | %{if($hash.$_ -eq $null) { $_ }; $hash.$_ = 1} > $PSScriptRoot\Data\TeamkillTotal.txt
            cls
            $FileContent = Get-Content "$PSScriptRoot\Data\TeamkillTotal.txt"
            $Teamkills = Select-String -InputObject $FileContent -Pattern "Teamkilled" -AllMatches
            cls
            Write-Host "             Finished!" -ForegroundColor Green
            Write-Host ""
            Write-Host "I counted" $Teamkills.Matches.Count "teamkills by $offender" -ForegroundColor White
        }
        
        "2"
        {
            cls
            Write-Host "Name needs to be 100% accurate to work properly" -ForegroundColor Green
            Write-Host ""
            Write-Host "Please enter Username below" -ForegroundColor White
            $offender = Read-Host
            Write-Host ""
            Write-Host "Working please wait..."

            Get-Content $PSScriptRoot\PostScriptum*.log | Select-String -SimpleMatch -Pattern "from $offender caused by" -Context 1, 3 | % { $_.context.PreContext + $_.line + $_.Context.PostContext } |  out-file "$PSScriptRoot\Data\FilterPass1.txt" -Force
            $Pattern = "from $offender caused by|TeamKilled"
            Get-Content "$PSScriptRoot\Data\FilterPass1.txt" | Where-Object { $_ -match $Pattern } | Set-Content "$PSScriptRoot\Data\FilterPass2.txt" -Force
            $PatternFinal = "Teamkilled $offender"
            Get-Content "$PSScriptRoot\Data\FilterPass2.txt" | Where-Object { $_ -notmatch $PatternFinal } | Set-Content "$PSScriptRoot\Data\FilterPass3.txt" -Force
            $Pattern = "TeamKilled"
            Get-Content "$PSScriptRoot\Data\FilterPass3.txt" | Where-Object { $_ -match $Pattern } | Out-File "$PSScriptRoot\Data\TeamkillPass1.txt" -Force
            $hash = @{}
            get-content "$PSScriptRoot\Data\TeamkillPass1.txt" | %{if($hash.$_ -eq $null) { $_ }; $hash.$_ = 1} > $PSScriptRoot\Data\TeamkillTotal.txt
            cls
            $FileContent = Get-Content "$PSScriptRoot\Data\TeamkillTotal.txt"
            $Teamkills = Select-String -InputObject $FileContent -Pattern "Teamkilled" -AllMatches
            cls
            Write-Host "             Finished!" -ForegroundColor Green
            Write-Host ""
            Write-Host "I counted" $Teamkills.Matches.Count "teamkills by $offender" -ForegroundColor White
        }
    }
} until ( $gameChoice -match "Q" )
