const { app, BrowserWindow, ipcMain } = require("electron");
const fetch = require("node-fetch");

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    },
  });

  mainWindow.loadFile("index.html");

  mainWindow.on("closed", () => {
    mainWindow = null;
  });
}

// Fetch the machines from the API
async function fetchMachines() {
  const response = await fetch("http://localhost:4000/api/machines");
  const machines = await response.json();
  return machines;
}

ipcMain.handle("get-machines", async () => {
  const machines = await fetchMachines();
  return machines;
});

app.whenReady().then(() => {
  createWindow();

  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();
  }
});
