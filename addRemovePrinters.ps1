$newPrinterPath = "\\WIN2016-AD1\"
$old
PrinterPath = "\\WIN2K8-PRINTERS\"

$oldPrinterPath = $oldPrinterPath.ToUpper()
$newPrinterPath = $newPrinterPath.ToUpper()

#Récupérer le sharename de l'imprimante par défaut
write-Host "Get default printer"
$DefaultPrinterShareName = (Get-WmiObject -Query "SELECT ShareName FROM Win32_Printer where Default=$true").sharename

$net = new-Object -com WScript.Network
Get-WmiObject -Class win32_printer | foreach {
    if(($_.Name.ToUpper()).StartsWith($oldPrinterPath)) { 
        write-Host "Removing printer " $_.Name
        $net.RemovePrinterConnection($_.Name)
        $newName = $newPrinterPath
        $newName += $_.ShareName
        write-Host "Adding $newName"
        $net.AddWindowsPrinterConnection($newName)
        if($_.Sharename -eq $DefaultPrinterShareName) {
            write-Host "Setting default Printer $newName"
            $net.SetDefaultPrinter($newName)
        }
    }
}
#$net = new-Object -com WScript.Network
#$net.RemovePrinterConnection($oldPrinterPath)
#$net.AddWindowsPrinterConnection($newPrinterPath)
