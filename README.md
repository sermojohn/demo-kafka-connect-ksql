# Demo of kafka-connect and jdbc connector

This demo uses kafka, zookeeper, kafka-connect, ksqldb, schema-registry and postgres 
and demonstrates the use of this stack in order to copy data added/updated on a table 
to another table.

## How to

1. Run the stack

```
docker-compose up -d
```

2. Connect to postgres and create needed tables. (db.sql):

```
docker-compose exec postgres bash -c 'psql -U $POSTGRES_USER'

```

3. Connect to ksqldb-server using ksqldb-cli to run queries on kafka topics:

```
docker-compose exec ksqldb-cli ksql http://ksqldb-server:8088

...
show topics;
print consoles;

```

4. Connect to kafka-connect to configure connectors (kafka-connect.txt):
```
docker-compose exec kafka-connect-01 sh
```

5. Run queries on the source table and observe data to be copied to the destination table.

# Notes

1. kafka-connect prior to version 6 contains a preselected set of plug-ins, so its not needed to install the `kafka-connect-jdbc`.
In kafka-connect versions after 6 the following command is needed: `confluent-hub install confluentinc/kafka-connect-jdbc:10.5.4`