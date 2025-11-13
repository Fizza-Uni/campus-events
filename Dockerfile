# Use a lightweight Nginx image as base
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default Nginx page
RUN rm -rf ./*

# Copy the built website files from the dist folder into the container
COPY dist/ .

# Expose port 80 to access the container from a browser
EXPOSE 80

# Start Nginx automatically when the container starts
CMD ["nginx", "-g", "daemon off;"]
