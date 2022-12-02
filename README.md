Just some Apache log parsers for now.

Some exemples:
```
./script.awk access.log
```
or
```
awk -f script.awk access.log
```


# HTTP Codes summary
```
$ ./httpcode.awk access.log 
   HTTP Code   Count	1st Occurrence		    Latest Occurrence
--------------------------------------------------------------------
  BadRequest       1	09/Mar/2019:14:53:29	09/Mar/2019:14:53:29
         200      30	09/Mar/2019:06:56:20	09/Mar/2019:18:30:27
         404       8	09/Mar/2019:13:13:23	09/Mar/2019:18:26:09
```

# Count Hits per minutes (you may want to sort results)
```
$ ./hitpermin.awk access.log | sort

09/Mar/2019:13:13	3
09/Mar/2019:14:14	1
09/Mar/2019:14:16	1
09/Mar/2019:14:25	1
09/Mar/2019:14:45	1
09/Mar/2019:14:53	2
09/Mar/2019:15:17	5
```

# Count Hits by hosts
```
$ ./hitbyhost.awk access.log 

177.130.40.*	1
157.55.39.*     1
77.159.90.*     1
20.188.213.*	1
83.157.236.*	1
```
