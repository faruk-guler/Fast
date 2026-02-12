# Enter the names of the Hyper-V Clusters or Hosts to check
$Clusters = @("CLUSTER1.farukguler.com")

# List to store results
$Report = @()

foreach ($Cluster in $Clusters) {
    try {
        # Get all nodes within the cluster
        $Nodes = Get-ClusterNode -Cluster $Cluster -ErrorAction Stop

        foreach ($Node in $Nodes) {
            # Retrieve all VMs from the host
            $VMs = Get-VM -ComputerName $Node.Name -ErrorAction Stop

            foreach ($VM in $VMs) {
                # Check if the VM has any snapshots
                $Checkpoints = Get-VMCheckpoint -VMName $VM.Name -ComputerName $Node.Name -ErrorAction SilentlyContinue

                if ($Checkpoints) {
                    foreach ($CP in $Checkpoints) {
                        $Report += [PSCustomObject]@{
                            Cluster       = $Cluster
                            Host          = $Node.Name
                            VMName        = $VM.Name
                            Checkpoint    = $CP.Name
                            CreatedTime   = $CP.CreationTime
                            SnapshotType  = $CP.SnapshotType
                        }
                    }
                }
                else {
                    $Report += [PSCustomObject]@{
                        Cluster       = $Cluster
                        Host          = $Node.Name
                        VMName        = $VM.Name
                        Checkpoint    = "None"
                        CreatedTime   = "-"
                        SnapshotType  = "-"
                    }
                }
            }
        }
    }
    catch {
        Write-Warning "Error: Unable to connect to cluster $Cluster. $_"
    }
}

# Display report on screen
$Report | Format-Table -AutoSize

# Export to HTML
$Header = @"
<style>
    TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse; width: 100%; font-family: Calibri, sans-serif;}
    TH {border-width: 1px; padding: 8px; border-style: solid; border-color: black; background-color: #4CAF50; color: white;}
    TD {border-width: 1px; padding: 8px; border-style: solid; border-color: black; text-align: left;}
    TR:nth-child(even) {background-color: #f2f2f2;}
</style>
"@

# Save and Convert file
$Report | ConvertTo-Html -Head $Header -Title "Hyper-V Snapshot Raporu" | Out-File "C:\HyperV_Snapshot_Report.html" -Encoding utf8

Write-Host "Rapor başarıyla oluşturuldu: C:\HyperV_Snapshot_Report.html" -ForegroundColor Green