<?php
// https://github.com/m23project/cloudstack-php-client
$tabhandler['depot']['cloudstack'] = 'showTab_cloudstack_import'; // register a report rendering function
$tab['depot']['cloudstack'] = 'CloudStack Import'; // title of the report tab

function showTab_cloudstack_import()
{
    /**************************
      File paths
     **************************/
    define("CLOUDSTACKCLIENT_FILE", dirname(__FILE__) . "/cloudstack_import/cloudstack-php-client/src/CloudStackClient.php");
    define("CLOUDSTACKCLIENT_CONFIG", dirname(__FILE__) . "/cloudstack_import/config.php");
    
    require CLOUDSTACKCLIENT_FILE;
    $config = require CLOUDSTACKCLIENT_CONFIG;
    
    //Initialization
    $cloudstack = new CloudStackClient($config['endpoint'], $config['api_key'], $config['secret_key']);
    //Lists
    $vms = $cloudstack->listVirtualMachines($account="fengce", $domainId = "9b832394-f254-4f6d-ba67-ed3979ac9fc6", $isRecursive="true");
    $vm_count = count($vms);

    $html = "<table>";
    foreach ($vms as $vm){
      $html = $html . "<tr>";
      $html .= "<td>" . $vm->state . "</td>";
      $html .= "<td>" . $vm->instancename . "</td>";
      $html .= "<td>" . $vm->zonename . "</td>";
      $html .= "<td>" . $vm->account . "</td>";
      $html .= "<td>" . $vm->hypervisor . "</td>";
      $html .= "<td>" . $vm->cpunumber . "</td>";
      $html .= "<td>" . $vm->memory . "</td>";
      $html .= "<td>" . $vm->created . "</td>";
      $html .= "<td>" . $vm->displayname . "</td>";
      $html .= "<td>" . $vm->hostname . "</td>";
      $html .= "</tr>";
    }
    $html .= "</table>";
    echo $html;
}
?>
