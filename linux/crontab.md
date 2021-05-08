The following crontab will run every 15 minutes from 12:00 onwards till 00:00 but excluding 00:00
```
# Example of job definition:
# .-------------------- minute (0 - 59)
# |    .--------------- hour (0 - 23)
# |    |    .---------- day of month (1 - 31)
# |    |    |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |    |    |  |  .---- day of week (0 - 6) (Sunday=0 or 7)
# |    |    |  |  |
# *    *    *  *  *     command to be executed
*/15 12-23  *  *  *     command
```

The following crontab will run every 15 minutes from 12:00 onwards till 00:00 but including 00:00. For this you need two lines!
```
# Example of job definition:
# .-------------------- minute (0 - 59)
# |    .--------------- hour (0 - 23)
# |    |    .---------- day of month (1 - 31)
# |    |    |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |    |    |  |  .---- day of week (0 - 6) (Sunday=0 or 7)
# |    |    |  |  |
# *    *    *  *  *     command to be executed
*/15 12-23  *  *  *     command
  0    00   *  *  *     command
```
