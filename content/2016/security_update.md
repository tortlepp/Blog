;;title=Security update
;;created=2016-09-30 23:27
;;modified=2016-09-30 23:29
;;category=Blog

With [Observatory by Mozilla](https://observatory.mozilla.org/) I checked the configuration of my web server and did some improvements. Now the result looks quite good:

[![Observatory by Mozilla Scan Summary](2016/mozilla_observatory.png)](2016/mozilla_observatory.png)

All I had to do is to add some lines to my *.htaccess* file. These are the relevant lines:

    <IfModule mod_headers.c>
      Header set Content-Security-Policy "default-src 'self';"
      Header set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
      Header set X-Content-Type-Options "nosniff"
      Header set X-Frame-Options "DENY"
      Header set X-XSS-Protection "1; mode=block"
    </IfModule>

There is a detailed explanation on the different configuration options in the [Mozilla Wiki](https://wiki.mozilla.org/Security/Guidelines/Web_Security). It is definitely worth to read that page if you are not too familiar with an advanced configuration of a web server!
