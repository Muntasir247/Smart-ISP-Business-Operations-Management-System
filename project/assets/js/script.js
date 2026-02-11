// Sidebar toggle
document.querySelectorAll(".has-submenu > a").forEach(menu => {
  menu.addEventListener("click", function (e) {
    e.preventDefault();
    this.parentElement.classList.toggle("open");
  });
});

// Keep submenu open on active page
document.querySelectorAll(".submenu a").forEach(link => {
  if (link.href === window.location.href) {
    link.classList.add("active");
    const parent = link.closest(".has-submenu");
    if (parent) parent.classList.add("open");
  }
});

/* ================== LOCAL STORAGE HELPERS ================== */

function getData(key, defaultData) {
  let data = JSON.parse(localStorage.getItem(key));
  if (!data) {
    localStorage.setItem(key, JSON.stringify(defaultData));
    return defaultData;
  }
  return data;
}

function saveData(key, data) {
  localStorage.setItem(key, JSON.stringify(data));
}

/* ================== EMPLOYEE ================== */

const empForm = document.getElementById("empForm");
if (empForm) {
  empForm.addEventListener("submit", function (e) {
    e.preventDefault();
    const name = document.getElementById("name").value;
    const dept = document.getElementById("dept").value;
    const salary = document.getElementById("salary").value;

    let employees = getData("employees", []);
    employees.push({ name, dept, salary });
    saveData("employees", employees);

    alert("Employee added");
    empForm.reset();
  });
}

function renderEmployees() {
  const table = document.getElementById("empTable");
  if (!table) return;

  let employees = getData("employees", []);

  table.innerHTML = "";
  employees.forEach((emp, i) => {
    const row = table.insertRow();
    row.innerHTML = `
      <td>${emp.name}</td>
      <td>${emp.dept}</td>
      <td>${emp.salary}</td>
      <td>
        <button class="delete" onclick="deleteEmployee(${i})">Delete</button>
      </td>
    `;
  });
}

function deleteEmployee(index) {
  let employees = getData("employees", []);
  employees.splice(index, 1);
  saveData("employees", employees);
  renderEmployees();
}

renderEmployees();

/* ================== SALARY ================== */

function renderSalary() {
  const table = document.getElementById("salaryTable");
  if (!table) return;

  let employees = getData("employees", []);

  table.innerHTML = "";
  employees.forEach(emp => {
    const row = table.insertRow();
    row.innerHTML = `
      <td>${emp.name}</td>
      <td>${emp.dept}</td>
      <td>${emp.salary}</td>
    `;
  });
}

renderSalary();

/* ================== GENERIC TABLE (Dept, Payhead, Position) ================== */

function setupSimpleTable(key, tableId, inputId) {
  const table = document.getElementById(tableId);
  const input = document.getElementById(inputId);
  const form = input ? input.closest("form") : null;

  if (!table) return;

  let data = getData(key, [
    { name: "Default 1" },
    { name: "Default 2" },
    { name: "Default 3" }
  ]);

  function render() {
    table.innerHTML = "";
    data.forEach((item, i) => {
      const row = table.insertRow();
      row.innerHTML = `
        <td>${item.name}</td>
        <td>
          <button class="delete" onclick="deleteRow('${key}', ${i})">Delete</button>
        </td>
      `;
    });
  }

  render();

  if (form) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      data.push({ name: input.value });
      saveData(key, data);
      input.value = "";
      render();
    });
  }
}

function deleteRow(key, index) {
  let data = getData(key, []);
  data.splice(index, 1);
  saveData(key, data);
  location.reload();
}

// Setup tables
setupSimpleTable("departments", "deptTable", "deptInput");
setupSimpleTable("payheads", "payheadTable", "payheadInput");
setupSimpleTable("positions", "positionTable", "positionInput");
