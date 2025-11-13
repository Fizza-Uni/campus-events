# Use Node.js official image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install Parcel and a simple static server globally
RUN npm install -g parcel http-server

# Copy all project files
COPY . .

# Build events.html into dist/
RUN parcel build src/events.html --dist-dir dist

# Expose port for the container
EXPOSE 8080

# Serve the dist folder using http-server
CMD ["http-server", "dist", "-p", "8080"]
