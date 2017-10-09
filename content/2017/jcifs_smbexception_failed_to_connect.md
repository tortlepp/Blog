;;title=JCIFS: SmbException - Failed to connect
;;created=2017-10-09 20:27
;;category=Java

Today I stumbled upon an exception while using [JCIFS](https://jcifs.samba.org/) to access a Windows Network Share. It took some time to figure out what was going on, so maybe this will help somebody who stumbles upon the same issue.

When I wanted to access the Network Share on a Windows Server 2012 R2, the connection failed immediately and I got a SmbException:

```
jcifs.smb.SmbException: Failed to connect: example.com/1.2.3.4
jcifs.util.transport.TransportException
java.net.SocketException: Connection reset
at java.net.SocketInputStream.read(SocketInputStream.java:210)
at java.net.SocketInputStream.read(SocketInputStream.java:141)
at jcifs.util.transport.Transport.readn(Transport.java:29)
at jcifs.smb.SmbTransport.peekKey(SmbTransport.java:388)
at jcifs.smb.SmbTransport.negotiate(SmbTransport.java:288)
at jcifs.smb.SmbTransport.doConnect(SmbTransport.java:319)
at jcifs.util.transport.Transport.run(Transport.java:241)
...
```

First, I thought the service on the server was not running or the firewall was blocking the connection, but both looked okay. So I started googling around and found this archived E-Mail: [[jcifs] Obscure Connection Issue](https://lists.samba.org/archive/jcifs/2015-June/010289.html). But the solution provided in the E-Mail did not help me on, as I was dealing with another issue.

So the next step was to ask one of the server admins if he had any idea about that problem. And, when he checked the server configuration, he finally figured out, that SMB1 was disabled; only SMB2 and above was enabled. Because JCIFS only supports SMB1, I could not connect to the server - yeah, even the exception made sense now. Of course, after enabling SMB1 I could access the Network Share and the exception was gone.

But disabling SMB1 is actually not a bad idea as this protocol is old and considered to be insecure. Even Microsoft will [remove its support in the future](https://blogs.technet.microsoft.com/filecab/2016/09/16/stop-using-smb1/). So one of my to-dos for the next weeks is to do some testing on [smbj](https://github.com/hierynomus/smbj). If it works as it is stated on the project site, I will use that instead of JCIFS and then I can drop SMB1 soon.
