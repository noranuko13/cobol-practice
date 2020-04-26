# cobol-practice

## Commands

```
docker-compose build && docker-compose up -d
docker exec -it cobol-practice /bin/bash
```

```
cobc -x src/basic/helloworld.cob -o bin/helloworld && ./bin/helloworld
cobc -x src/basic/syntax.cob -o bin/syntax && ./bin/syntax
```
