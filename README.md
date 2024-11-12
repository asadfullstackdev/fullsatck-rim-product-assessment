# Rim Product Project Setup - Backend and Frontend

# Backend Setup/installation

This is the backend for the **Rim Product Assessment** project, built with **Phoenix Framework** and **Elixir**. It handles product assessments, user management, and provides real-time updates for the frontend.

## Prerequisites

Before getting started, ensure that the following software is installed on your machine:

- **Elixir** (version 1.14 or later)
- **Phoenix Framework** (version 1.7 or later)
- **PostgreSQL** (or your preferred database)

## Installation and Setup

Follow these steps to set up the project on your local machine:

1. **Clone the Repository**  
   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/rim-product-assessment.git
   cd rim-product-assessment

   ```

2. **Install Elixir Dependencies**
   Install the project dependencies by running the following command:

mix deps.get

3. **Set Up the Database**
   Run the following commands to create and migrate your database:

mix ecto.create
mix ecto.migrate

4. **Running the Server**
   Navigate to the `backend/` folder.
   Run the following command to build and run the Phoenix backend:

mix phx.server

2. Run the following command to build and run the Elixir backend app on Docker

sudo apt install docker-ce

```bash
docker build -t rim-product-backend ./backend
docker run -p 4000:4000 rim-product-backend
```

### Backend API

The backend exposes an API at `http://localhost:4000/api/machines` which returns a list of machines.

# ====================================================================================================

# Frontend Setup/installation

This is the frontend for the **Rim Product Assessment** project, built with **Phoenix LiveView**, **JavaScript**, and **Electron.js** for desktop app support. It interacts with the backend to display product assessments, user information, and real-time updates.

## Prerequisites

Before getting started, ensure that the following software is installed on your machine:

- **Node.js** (version 16.x or later)
- **npm** (or **yarn**) for managing frontend dependencies
- **Electron.js** (for building and packaging the desktop app)

## Installation and Setup

Follow these steps to set up the project on your local machine:

- **Install Frontend Dependencies**
  Install the project dependencies by running the following command in the project directory:

1. Navigate to the `frontend/` folder.
   npm install
   npm install electron --save-dev
   npm run electron

2. Run the following command to build and run the Electron app on Docker:

   sudo apt install docker-ce

   ```bash
   docker build -t rim-product-frontend ./frontend
   docker run -p 3000:3000 rim-product-frontend
   ```

### Interaction

The frontend will display either a keyword input or a machine selection dropdown depending on whether any machines are returned from the API.
