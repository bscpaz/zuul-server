<h1 align="center">Zuul Server</h1>
<p align="center">This page shows a exeample of how to setup a Zuul Server.</p>

### Configuration

As Zuul is deprecated, you cannot choose it anymore from Spring Boot dependencies. So, go to https://start.spring.io/, generate a empty project and add the following dependencies into pom.xml:

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
</dependency>

<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
</dependency>

<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-netflix-zuul</artifactId>
</dependency>
```
### Docker-Compose example

##### Add this service into a docker-compose.yaml at one level above the "gateway" folder
```console
(...)

  gateway:
    build:
      context: /home/bscpaz/projects/gateway
      dockerfile: Dockerfile
    container_name: gateway
    ports:
      - '8180:8180'
      - '8181:8181'
    environment:
      - ENV_PORT=8181
      - ENV_HOST=gateway
      - EUREKA_SERVER_DEFAULT_ZONE=http://discovery:8761/eureka/
      - EUREKA_INSTANCE_PREFERIPADDRESS=true
      - GATEWAY_ACTIVE_PROFILES=dev
    depends_on:
      - discovery
```
