function curlSMS($url,$post_fields=array()){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 3600); //60秒
        curl_setopt($ch, CURLOPT_HEADER,1);
        curl_setopt($ch, CURLOPT_REFERER,'http://www.yourdomain.com');
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$post_fields);
        $data = curl_exec($ch);
        curl_close($ch);
        $res = explode("\r\n\r\n",$data);
        return $res[2];
}

def curlSMS(url, params):
    import pycurl, urllib

    post_data = urllib.urlencode(params)

    c = pycurl.Curl()
    c.setopt(c.URL, url)
    c.setopt(c.POST, 1)
    c.setopt(pyc.CONNECTTIMEOUT, 60)
#    c.setopt(pyc.HEADER, True)
#    c.setopt(c.TIMEOUT, 60)
    c.setopt(c.CURLOPT_RETURNTRANSFER,1)
    c.setopt(c.FAILONERROR, True)
    c.setopt(c.CURLOPT_REFERER,'http://www.yourdomain.com')
    c.setopt(c.CURLOPT_HEADER,1)
    

    try:
        c.perform()
        c.setopt(c.POSTFIELDS, post_data)
        print "HTTP-code:", c.getinfo(c.HTTP_CODE)
        print "Total-time:", c.getinfo(c.TOTAL_TIME)
        print "Download speed: %.2f bytes/second" % c.getinfo(c.SPEED_DOWNLOAD)
        c.close()
    
    except pycurl.error, error:
        errno, errstr = error
        print 'An error occurred: ', errstr
