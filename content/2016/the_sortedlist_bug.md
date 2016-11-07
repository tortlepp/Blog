;;title=The SortedList bug
;;created=2016-07-26 20:23
;;category=Java, JavaFX


While I was developing on [SimpleTaskList](https://github.com/tortlepp/SimpleTaskList) I found a strange behavior of TableView: When I removed items from the underlying list the TableView crashed somehow.

I did further investigation and discovered that an ArrayIndexOutOfBoundsException occurred. But the exception did not occur in the TableView or the underlying list. Instead it occurred in the SortedList - in which the list of the TableView was wrapped in. A research led me to the bug [JDK-8087508](https://bugs.openjdk.java.net/browse/JDK-8087508).

And in this bug ticket is already a workaround for the ArrayIndexOutOfBoundsException. The SortedList uses an array and that has to be resorted when the list is resorted. So in the end I did what Kevin Rushforth and David Gilbert suggested: I applied the provided fix and created a CustomSortedList. And finally my TableView works like a charm.
