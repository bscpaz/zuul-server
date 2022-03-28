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

Change the main class as following:

```java
package br.com.bscpaz.microservice.zull;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
public class ZuulServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZuulServerApplication.class, args);
	}
}
```
Then, configure application.yml file as following:
```
server:
  port: ${ENV_PORT:8181}

spring:
  application:
    name: ${ENV_HOST:zuul-server}
    
eureka:  
  client:
    register-with-eureka: true
    fetch-registry: true
    service-url:
      defaultZone: ${EUREKA_SERVER_DEFAULT_ZONE}

#Expõe as rotas que encontrou no Eureka      
management:
  endpoints:
    web:
      exposure:
        include:
        - "routes"
        
#Repassa o token no cabeçalho para os próximos serviços.         
zuul:
  sensitive-headers:
  - Cookie, Authorization   
```
