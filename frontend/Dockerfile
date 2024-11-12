# Use Node.js 16 with Debian-based image (includes libraries Electron needs)
FROM node:16

# Set working directory
WORKDIR /app

COPY package*.json ./

# Install necessary dependencies for Electron
RUN apt-get update && apt-get install -y \
    bash \
    libx11-dev \
    libxcomposite1 \
    libxrandr2 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libpango1.0-0 \
    libxss1 \
    xdg-utils && \
    apt-get clean

# Install dependencies via npm
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose port 3000 for the frontend
EXPOSE 3000

# Run Electron app
CMD ["npx", "electron", ".", "--no-sandbox"]
