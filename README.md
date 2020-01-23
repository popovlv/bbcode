# WebSec Vulnerable BBCode Web Application

This project defines a very simple Spring Web application that lets
users markup input with
[BBCode](https://en.wikipedia.org/wiki/BBCode). The BBCode
implementation is [KefirBB](http://kefirsf.org/kefirbb/).

The application is intended for use in the lab of my Web Security course - so
expect security issues, I left them in on purpose!!

## Build & Install

1. Make sure you have JDK >= 7 installed
   (Both OpenJDK and Oracle's JDK should work.)
2. Download and, if necessary, unpack the project source code
   (either as a Git repository clone or as a ZIP archive).
3. In the project top level directory, run `./mvnw clean install`.
   (On its first run, this will also download Maven.)
4. Run the application in its embedded Tomcat by calling
   `java -jar target/BBCode.war`.
5. Navigate your browser to <http://localhost:8080/>

