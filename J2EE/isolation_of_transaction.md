## Summary of isolation of transacion:

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

## Two kinds of lock:
Pessimistic lock and Optimistic lock, it's not lock of database, it's concept that people used to describe the mechanism of how to use database lock to read and update data.
* Pessimistic lock
	It's implemented by lock of database, like row lock, page lock and table lock. It's means transaction A also don't trust other transactions, so before update data, it always try to add exclusive locking on these data it will update. If add lock failed, it means other transaction is updating these data, then it will wait or fail (depends on application implementation). If add lock success, it will update data and then release the lock.
	begin tran
		select something for update
	commit tran

* Optimistic lock
	This kind of lock is not using database lock to implement, one of the solution is that add one more column "version", every update will based on the version, like below example. This kind of lock doesn't add lock to table or rows, that's will improve peformance, but may face some issue like two transactions read some record and update it then write into database.

	select row1, version from table
	update row1=new_row1, version=version+1 from table where version=$version

Two locks have it's own advantage and disadvantage. I think it should based on the business to decide which lock to use.


