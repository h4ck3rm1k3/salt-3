<?php
// Custom Racktables Report v.0.3
// Libary file

// 2012-10-23 - Mogilowski Sebastian <sebastian@mogilowski.net>

error_reporting(E_ERROR | E_PARSE);

/**
 * Get the location of an RackTables object
 *
 * @param array $aObject
 * @return string
 */
function getLocation($aObject) {
    $sRowName = 'unknown';
    $sRackName = 'unknown';

    # Try to read the mount informations of the object
    if ( function_exists('getMountInfo') ) {
        $mountInfo = getMountInfo (array($aObject['id']));

        if ( isset( $mountInfo[$aObject['id']][0]["rack_name"] ) )
            $sRackName = $mountInfo[$aObject['id']][0]["rack_name"];

        $sRowName = 'unknown';
        if ( isset( $mountInfo[$aObject['id']][0]["row_name"] ) )
            $sRowName = $mountInfo[$aObject['id']][0]["row_name"];
    }
    else {
        if ( isset( $aObject["Row_name"] ) )
            $sRowName = $aObject["Row_name"];

        if ( isset( $aObject["Rack_name"] ) )
            $sRackName = $aObject["Rack_name"];
    }

    # No mount information available - check for a container
    if ( ( $sRowName == 'unknown' ) && ( $sRackName == 'unknown' ) && ( isset( $aObject['container_id'] ) ) ) {
        $sContainerName = '<a href="'. makeHref ( array( 'page' => 'object', 'object_id' => $aObject['container_id']) )  .'">'.$aObject['container_name'].'</a>';

    	$attributes = getAttrValues ($aObject['id']);
    	if ( isset($attributes['28']['a_value']) && $attributes['28']['a_value'] != '' )
    	    $sLocation = $sContainerName.': Slot '.$attributes['28']['a_value'];
    	else
           $sLocation = $sContainerName;

        # Get mount info of the container
        $sContainerRowName = 'unknown';
        $sContainerRackName = 'unknown';

        if ( function_exists('getMountInfo') ) {

            $containerMountInfo = getMountInfo (array($aObject['container_id']));

            if ( isset( $containerMountInfo[$aObject['container_id']][0]["rack_name"] ) )
                $sContainerRackName = $containerMountInfo[$aObject['container_id']][0]["rack_name"];

            if ( isset( $containerMountInfo[$aObject['container_id']][0]["row_name"] ) )
            $sContainerRowName = $containerMountInfo[$aObject['container_id']][0]["row_name"];

            $sLocation = $sContainerRowName.': '.$sContainerRackName . '<br/>' . $aResult[$aObject['id']]['sLocation'];

        }
    }
    else {
        $sLocation = $sRowName.': '.$sRackName;
    }

    return $sLocation;

}

 /**
  * Create hyperlinks in text
  *
  * @param string $sText
  * @return string
  */
 function makeLinksInText($sText)
 {
    return preg_replace("/(http:\/\/|(www\.))(([^(\s|,)<]{4,68})[^(\s|,)<]*)/", '<a href="http://$2$3" target="_blank">$1$2$4</a>', $sText);
 }


 # Need for backward compatibility - Define function from Racktables version 0.20.x
if ( !function_exists('ip6_format') )
{

    function ip6_format ($ip_bin) {
        // maybe this is IPv6-to-IPv4 address?
        if (substr ($ip_bin, 0, 12) == "\0\0\0\0\0\0\0\0\0\0\xff\xff")
            return '::ffff:' . implode ('.', unpack ('C*', substr ($ip_bin, 12, 4)));

        $result = array();
        $hole_index = NULL;
        $max_hole_index = NULL;
        $hole_length = 0;
        $max_hole_length = 0;

        for ($i = 0; $i < 8; $i++) {

            $unpacked = unpack ('n', substr ($ip_bin, $i * 2, 2));
            $value = array_shift ($unpacked);
            $result[] = dechex ($value & 0xffff);

            if ($value != 0) {

                unset ($hole_index);
                $hole_length = 0;

            }
            else {

                if (! isset ($hole_index))
                    $hole_index = $i;
                if (++$hole_length >= $max_hole_length) {
                    $max_hole_index = $hole_index;
                    $max_hole_length = $hole_length;
                }

            }

        }

        if (isset ($max_hole_index)) {
             array_splice ($result, $max_hole_index, $max_hole_length, array (''));

            if ($max_hole_index == 0 && $max_hole_length == 8)
                return '::';
            elseif ($max_hole_index == 0)
                return ':' . implode (':', $result);
            elseif ($max_hole_index + $max_hole_length == 8)
                return implode (':', $result) . ':';
        }

        return implode (':', $result);
    }

}

?>
