# Use the official Amazon Linux 2 image as the base image
FROM amazonlinux:2

# Install necessary packages, including amazon-efs-utils and python3
RUN yum install -y amazon-efs-utils python3 && \
    yum clean all

# Copy the blog files to the server directory
COPY index.html /var/www/html/index.html
COPY styles.css /var/www/html/styles.css
COPY script.js /var/www/html/script.js

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start a simple Python HTTP server
CMD ["python3", "-m", "http.server", "80"]
