## Try zookeepr with 3 instance in one server
#### Configurations
* copy conf from zookeeper package
* dataDir should be different for each instance.
* clientPort should be different for each instance.
* server.X=zooX:port_1:port_2
    
  1. X is the server number, and it should be same as the number in file "myid" in dataDir.
    
  2. zooX is the ip of server X.
    
  3. port_1 is the port that one instance conmunicate with each other.
    
  4. port_2 is used for election of master server.

* Don't forget to copy log4j file

#### Start zookeeper
* Don't copy bin directory, too many dependency and var there.
* Need to set ZOOCFGDIR
