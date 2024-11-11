# Rim Product - Backend and Frontend

## Backend

### Running the Backend

1. Navigate to the `backend/` folder.
2. Run the following command to build and run the Phoenix backend:

   ```bash
   docker build -t rim-product-backend ./backend
   docker run -p 4000:4000 rim-product-backend
   ```

### Backend API

The backend exposes an API at `http://localhost:4000/api/machines` which returns a list of machines.

## Frontend (Electron)

### Running the Frontend

1. Navigate to the `frontend/` folder.
2. Run the following command to build and run the Electron app:

   ```bash
   docker build -t rim-product-frontend ./frontend
   docker run -p 3000:3000 rim-product-frontend
   ```

### Interaction

The frontend will display either a keyword input or a machine selection dropdown depending on whether any machines are returned from the API.
