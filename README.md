<h1 align="center">Zuul Server</h1>
<p align="center">This page has just a exeample of how to setup a Zuul Server.</p>

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
