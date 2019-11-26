## Comunication between service.


## A service data change based on B service return
-
  Start a transaction T1 in service A, update data in database of service A, and then call service B for data.
  If data as expected, commit transaction T1, else if data is not expected, throw exception to rollback data,
  or call rollback to rollback transaction T1.
  
