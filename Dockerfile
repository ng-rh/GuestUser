# Use an official JBoss Web Server image with Tomcat 11 as the base image.
FROM registry.redhat.io/jboss-webserver-5/jws56-openjdk11-openshift-rhel8:latest

ARG DB_HOST=mysql.guest-user.svc.cluster.local
ARG DB_NAME=ssoRegisterGuest
ARG DB_USER=admin	
ARG DB_PASSWORD=adminpass

# Set environment variables for the database connection
ENV DATABASE_URL=$DB_HOST
ENV DATABASE_NAME=$DB_NAME
ENV DATABASE_USER=$DB_USER
ENV DATABASE_PASSWORD=$DB_PASSWORD

# Switch User
USER jboss
# Create logs directory
VOLUME /home/manager/ssoRegisterGuestLogs/

# Create a directory to copy your application WAR file
#RUN mkdir /deployments/GuestUser

# Copy your Ant-built WAR file into the deployment directory
COPY dist/GuestUser.war /deployments/

# Expose the default HTTP and HTTPS ports
EXPOSE 8080
EXPOSE 8443


