$Printerpath = "\\P2D2"
$net = new-Object -com WScript.Network
Get-WmiObject -Class win32_printer | foreach {

    if($_.Name.StartsWith($PrinterPath)) {
        write-Host "Deleting $_.Name"
        $net.RemovePrinterConnection($_.Name)
    }
}
