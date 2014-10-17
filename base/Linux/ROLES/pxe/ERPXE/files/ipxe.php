<?PHP
foreach($_GET as $k=>$v) $$k=$v;
echo "#!ipxe
set 209:string pxelinux.cfg/default
set 210:string http://10.24.4.97/pxe/
chain \${210:string}pxelinux.0 ||
chain http://boot.ipxe.org/demo/boot.php ||
shell
";
?>
