# Use the official Nginx base image
FROM nginx:latest as base

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf


# Expose port 80
EXPOSE 80

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]