;;title=Access Nextcloud with PHP and cURL
;;created=2016-08-16 17:05
;;category=PHP, Nextcloud

[Nextcloud](https://nextcloud.com/) is a nice solution if you want to sync your files across multiple devices and access them wherever you are. If you want to automate some processes, you may want to do some things like uploading certain files into Nextcloud automatically. In this case [PHP and cURL](http://php.net/manual/en/book.curl.php) will help you to do so.

Uploading a file into Nextcloud is easy:

    $filesize = filesize('example.jpg');
    $file = fopen('example.jpg', 'r');
    
    $curl = curl_init('https://www.example.com/nextcloud/remote.php/webdav/ExampleFolder/example.jpg');
    curl_setopt($curl, CURLOPT_USERPWD, 'USER:PASSWORD');
    curl_setopt($curl, CURLOPT_PUT, true);
    curl_setopt($curl, CURLOPT_INFILE, $file);
    curl_setopt($curl, CURLOPT_INFILESIZE, $filesize);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_exec($curl);
    
    curl_close($curl);
    fclose($file);

To check if the upload was successful you can use `curl_getinfo($curl, CURLINFO_HTTP_CODE)` - it will return `201` if the upload was successful.

Downloading a file is easy as well:

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, 'https://www.example.com/nextcloud/remote.php/webdav/ExampleFolder/example.txt');
    curl_setopt($curl, CURLOPT_USERPWD, 'USER:PASSWORD');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $content = curl_exec($curl);
    curl_close($curl);

Now `$content` contains the content of the file, to write it to disk you can use `file_put_contents('example.txt', $content)`.

And besides uploading and downloading files you can do other things as well. For example you can get a list of files in a folder:

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, 'https://www.example.com/nextcloud/remote.php/webdav/ExampleFolder');
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'PROPFIND');
    curl_setopt($curl, CURLOPT_USERPWD, 'USER:PASSWORD');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $result = curl_exec($curl);
    curl_close($curl);
    
    $xml = new SimpleXMLElement($result);
    $files = array();
    foreach ($xml->xpath('//d:href') as $element) {
      array_push($files, $element);
    }

In the first step you get a list with the content of the directory. Because the list is in XML format the second step is necessary to extract the filenames - finally `$files` will contain the filenames.

These examples show you how easy it is to access and use Nextcloud with PHP and cURL. But keep in mind that this code is just an example without any checking and error handling.
