# Docker compose example

# Update stack

```
$ docker-compose up --build -d [--force-recreate]
```

## Check status

```
$ docker-compose ps
          Name                        Command               State    Ports
--------------------------------------------------------------------------
composedemo_hello-9001_1   sh -c java -cp ./* ${JAVA_ ...   Exit 0
composedemo_hello-9002_1   sh -c java -cp ./* ${JAVA_ ...   Exit 1
composedemo_hello-9003_1   sh -c java -cp ./* ${JAVA_ ...   Exit 0
```
```
$ docker-compose logs
Attaching to composedemo_hello-9001_1, composedemo_hello-9003_1, composedemo_hello-9002_1
hello-9001_1  | Hello, World!
hello-9003_1  | Hello, World!
hello-9002_1  | Error: Could not find or load main class com.fail.Main
hello-9002_1  | Caused by: java.lang.ClassNotFoundException: com.fail.Main
```

## Clean up

```
$ docker-compose down
```
