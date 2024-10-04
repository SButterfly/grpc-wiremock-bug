wiremock example to reproduce the bug with grpc extension


# How to reproduce

```bash
( cd docker && ./docker/run.sh )
grpcurl -plaintext -d '{}' localhost:8080 myservice.MyService/QueryEvents
```

Expected to return a success answer, but returned 
```bash
Error invoking method "myservice.MyService/QueryEvents": target server does not expose service "myservice.MyService"
```
