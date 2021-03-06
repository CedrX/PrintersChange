$tabPrinters = @( "\\P2D2-AD\Photocop1",
"\\P2D2-AD\COLOR-SCTD",
"\\P2D2-AD\HP 6930P1606",
"\\P2D2-AD\HP 6931P1606",
"\\P2D2-AD\HP 6932P1606",
"\\P2D2-AD\HP1320",
"\\P2D2-AD\HP2055" )

$net = new-Object -com WScript.Network
foreach($printer in $tabPrinters) {
    write-Host "Adding $printer"
    $net.AddWindowsPrinterConnection($printer)
}

#$net = new-Object -com WScript.Network
#$net.AddWindowsPrinterConnection("\\P2D2-AD\COLOR-SCTD")