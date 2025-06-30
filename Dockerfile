# Use Tomcat 10.0.27 with JDK 21
FROM tomcat:10.0.27-jdk21

# Remove the default ROOT webapp (we'll replace it with your own)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into Tomcat's webapps directory as ROOT.war
COPY app.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat's port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
