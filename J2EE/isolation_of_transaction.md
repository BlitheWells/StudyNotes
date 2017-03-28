### Summary of isolation of transacion:

* Read uncommit
	This level allow transaction A read data that transaction B update or insert but not commit yet.
* Read commit
	This level transaction A can only read these data that already commited by transaction B.
	This mean if transaction A read some data before transaction B commit, after transaction B make some changes and commit and transaction A read data again, then data set will be different.
	So it's non-repeatable read.
* Repeatable read
	This level when transaction A read some data, other transaction will not able to udpate these data. So in transaction A, no matter what time to read data, data set will be same. It's repeatable read.
	But it's only for update/delete, if other transactions insert new data, it may still cause transaction A get different data set for different call.
* Serializable
	This level can make sure transaction A read same data, and no new data inserted. This level will lose some performance.
