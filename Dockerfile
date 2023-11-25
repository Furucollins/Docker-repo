FROM ubuntu
RUN echo "CLass-23 DevOps"
ENTRYPOINT [ "echo" "Hello world" ]

#git docker clone git repo
FROM apline/git
WORKDIR /app1
RUN git clone https://github.com/Lion-Technology-Solutions/liontech-online-library-web-app.git

#maven 

FROM maven:3.9-amazoncorretto-19 as build 
WORKDIR /app1
COPY --from=repo /app1/liontech-online-library-web-app /app1/
RUN mvn test 
RUN mvn instarun
RUN mvn clean package 
