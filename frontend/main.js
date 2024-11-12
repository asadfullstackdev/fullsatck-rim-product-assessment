const { app, BrowserWindow, ipcMain } = require("electron");
const fetch = require("node-fetch");

let mainWindow;

// Create a new BrowserWindow
const createWindow = () => {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    },
  });
  mainWindow.loadFile("index.html");
  mainWindow.on("closed", () => (mainWindow = null));
};

// Fetch machines from the API
const fetchMachines = async () => {
  try {
    const response = await fetch("http://localhost:4000/api/machines");
    return response.ok ? await response.json() : [];
  } catch (error) {
    console.error("Failed to fetch machines:", error);
    return [];
  }
};

ipcMain.handle("get-machines", fetchMachines);

// Initialize the app
const initializeApp = () => {
  createWindow();

  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
};

app.whenReady().then(initializeApp);
app.on("window-all-closed", () => {
  if (process.platform !== "darwin") app.quit();
});
