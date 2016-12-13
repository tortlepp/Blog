;;title=wsimport behind a proxy
;;created=2016-12-09 19:23
;;category=Java

The JDK tool `wsimport` is very useful when you are developing a client for a SOAP web service. But at least the recent version shipped with JDK 8 is complicated to use when you are behind a proxy.

Just a short example:

    wsimport -d src -keep -p com.example http://localhost:8080/service?wsdl

If you are behind a proxy, this call may fail and in the output you will see something like:

    [ERROR] Server returned HTTP response code: 504 for URL: http://localhost:8080/service?wsdl

HTTP status code 504 means "Gateway Timeout". And that error occurs because `wsimport` detects the proxy configured in Windows (Internet Options) and uses it for all connections. It ignores the exception list you probably have configured and also there is no parameter to tell wsimport not to use the proxy (that lack of feature was [reported some time ago](https://java.net/jira/browse/JAX_WS-1154)).

My solution is to disable the proxy temporarily in internet settings when I start `wsimport` - then it works like a charm. Another possible solution is to use `wsimport` from JDK 6. It seems that this version does not detect the proxy configured in the system and uses only a proxy when it is explicitly set via parameters.
