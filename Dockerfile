FROM ubuntu:latest

# Install Apache
RUN apt update && apt install -y apache2

# Configure Apache to listen on port 85
RUN sed -i 's/Listen 80/Listen 85/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:85>/' /etc/apache2/sites-available/000-default.conf

# Copy application files to the web root
COPY . /var/www/html

# Expose port 85
EXPOSE 85

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
