 Use the official Node.js 16 image as the base imageFROM node:16
# Set the working directory inside the container
WORKDIR /app
# Copy package.json and package-lock.json (or yarn.lock) to the containerCOPY package*.json ./
# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
# Copy only package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy only necessary source files
COPY src/ ./src
COPY public/ ./public
COPY images/ ./images

# Build the React app
RUN npm run build

# Expose the port and start the app
EXPOSE 3000
CMD ["npm", "start"]
