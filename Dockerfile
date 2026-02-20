# Use official Tomcat image with Java 17
FROM tomcat:9.0-jdk17

LABEL maintainer="yourname@example.com"

# Remove default ROOT app completely
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/ROOT.war

# Add Postgres JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.7.4.jar /usr/local/tomcat/lib/

# Copy WAR as ROOT so app loads at /
COPY community-chat.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
