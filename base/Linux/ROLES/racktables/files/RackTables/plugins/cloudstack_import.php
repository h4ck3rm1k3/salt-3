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
    $vms = $cloudstack->listVirtualMachines();
    foreach ($vms as $vm) {
        echo("{$vm->id} : {$vm->name} {$vm->state}<br>");
    }
}
?>
