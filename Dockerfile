# Use the official Node.js LTS image
FROM node:24

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache
# This ensures dependencies are only re-installed if these files change
COPY package.json ./

# Install project dependencies
RUN npm install 

# Copy the rest of your application's code into the container
COPY . .

# Expose the port Vite/Vue CLI uses for the dev server (default is 5173 for Vite)
EXPOSE 5173

# The command to start the development server
CMD ["npm", "run", "dev"]