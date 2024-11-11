const { ipcRenderer } = require("electron");

document.getElementById("submit-keyword").addEventListener("click", () => {
  const keyword = document.getElementById("keyword").value;
  ipcRenderer.invoke("submit-keyword", keyword).then((response) => {
    alert("You submitted: " + response);
  });
});

document.getElementById("submit-machine").addEventListener("click", () => {
  const machineId = document.getElementById("machine-select").value;
  ipcRenderer.invoke("submit-machine", machineId).then((response) => {
    alert("You selected: " + response);
  });
});

// Fetch the machine list and update the UI
ipcRenderer.invoke("get-machines").then((machines) => {
  if (machines.length > 0) {
    const machineSelect = document.getElementById("machine-select");
    machines.forEach((machine) => {
      const option = document.createElement("option");
      option.value = machine.id;
      option.textContent = machine.name;
      machineSelect.appendChild(option);
    });

    document.getElementById("keyword-section").style.display = "none";
    document.getElementById("machine-section").style.display = "block";
  } else {
    document.getElementById("keyword-section").style.display = "block";
    document.getElementById("machine-section").style.display = "none";
  }
});
