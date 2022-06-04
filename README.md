# TP .Net Week 3 SQL

This project is an example of using MSSQL and SQL Queries.

### What I have used so far:

- MSSQL Server as an Database and SQLServer packages.
- Using DBeaver to display the tables.

## Requirements
- Creating a SocialNetworkDB.
- Messages can be text, image or video.
- Users can add friends.
- Messages can be public or private.
- When user update a message, generate an entry to UserMessageArchive table.
- When user make a request, it will send to FriendShipApproval table.
- Writing a query to return max message senders.

## Design
- To Create the DB first, we need to execute;
```c
	CREATE DATABASE SocialNetworkDB;
```

- To add the tables, please click this [link!](https://github.com/mhtaldmr/hafta3-mhtaldmr/blob/main/Database/tables_creation.sql)

- Database Tables and Relationships
 <br>
<img src="https://github.com/mhtaldmr/hafta3-mhtaldmr/blob/main/SocialNetworkDB.png" alt="design" />


## Queries
- Writing 3 query for requirements.
	- For updating messages a [TRIGGER](https://github.com/mhtaldmr/hafta3-mhtaldmr/blob/main/Queries/TriggerMessageUpdate.sql) created for Inserting a Message Archive ***BEFORE*** action and then updated.
	- For friend request a [TRIGGER](https://github.com/mhtaldmr/hafta3-mhtaldmr/blob/main/Queries/TriggerAfterFriedRequest.sql) created for Inserting a FriendshipApproval ***AFTER*** request action.
	- For Max message senders a [PROCEDURE](https://github.com/mhtaldmr/hafta3-mhtaldmr/blob/main/Queries/ProcedureGetMaxNumOfMessageSenders.sql) created.

---