# Use Ubuntu-based JDK 21 image (apt-get works here)
FROM eclipse-temurin:21-jdk

# Set environment variables for Tomcat
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Download and extract Tomcat 10.0.27
RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz && \
    mkdir -p /opt && \
    tar xzf apache-tomcat-10.0.27.tar.gz -C /opt && \
    mv /opt/apache-tomcat-10.0.27 /opt/tomcat && \
    rm apache-tomcat-10.0.27.tar.gz

# Remove default ROOT webapp
RUN rm -rf /opt/tomcat/webapps/ROOT

# Copy your WAR file into Tomcat's webapps
COPY app.war /opt/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
