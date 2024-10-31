# Using the official Alpine Linux image
FROM alpine:latest

# Update package index and install Nginx
RUN apk update && apk add nginx

# Remove the default Nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy artifact (dist) to the Nginx directory
COPY ./dist /usr/share/nginx/html/

# Remove the default Nginx configuration
RUN rm -f /etc/nginx/http.d/default.conf

# Load custom Nginx configuration into the image
COPY ./oleksapp.conf /etc/nginx/http.d/

# Open port 80 for HTTP
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
