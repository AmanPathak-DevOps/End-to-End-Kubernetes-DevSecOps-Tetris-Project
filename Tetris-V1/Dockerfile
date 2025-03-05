# Use the official Node.js 16 image as the base image
FROM node:16

# Create a non-root user and group
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install project dependencies as a non-root user
# Set npm cache directory to a place where appuser can write
RUN npm config set cache /app/.npm-cache --global
RUN npm install

# Change ownership of the /app directory to the non-root user
RUN chown -R appuser:appuser /app

# Set the user to the non-root user
USER appuser

# Copy the necessary application files to the container
COPY src/ ./src
COPY public/ ./public
COPY images/ ./images

# Build the React app
RUN npm run build

# Expose the port and start the app
EXPOSE 3000
CMD ["npm", "start"]
