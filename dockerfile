FROM ubuntu:24.04

# Install Java, Maven, and required tools
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy Maven project into container
COPY app /app

# Build the project
RUN mvn clean package

# Run the application
CMD ["java", "-jar", "target/simple-app-1.0-SNAPSHOT-jar-with-dependencies.jar"]

