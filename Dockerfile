# Use the official node image as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# RUN npm set fetch-timeout=60000

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Install a simple HTTP server to serve static files
RUN npm install -g serve

ARG VITE_REACT_APP_API_URL
ENV VITE_REACT_APP_API_URL=$VITE_REACT_APP_API_URL

# Expose port 3000
EXPOSE 1315

# Command to run the application
CMD ["serve", "-s", "dist", "-l", "1315"]
