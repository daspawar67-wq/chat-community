# Use official Tomcat image with Java 17
FROM tomcat:9.0-jdk17

LABEL maintainer="yourname@example.com"

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT.WAR

# Add Postgres JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.7.4.jar /usr/local/tomcat/lib/


# Copy your WAR file into Tomcat webapps directory
COPY community-chat.war /usr/local/tomcat/webapps/ROOT.war


# Environment variables for Supabase (set in Render dashboard)
ENV DB_URL="jdbc:postgresql://aws-1-ap-southeast-2.pooler.supabase.com:5432/postgres?sslmode=require"
ENV DB_USER="postgres.mypvkjyjtggnmvctqxzx"
ENV DB_PASSWORD="gd096M41b1RvdFnQ"

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
