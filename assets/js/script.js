document.addEventListener("DOMContentLoaded", function () {
  const sidebarToggle = document.querySelector(".sidebar-toggle");
  const sidebar = document.querySelector(".sidebar");

  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", function () {
      sidebar.classList.toggle("active");

      if (window.innerWidth > 768) {
        if (sidebar.style.marginLeft === "-250px") {
          sidebar.style.marginLeft = "0";
        } else {
          sidebar.style.marginLeft = "-250px";
        }
      }
    });
  }

  // Sidebar Dropdown functionality
  const dropdownItems = document.querySelectorAll(".has-submenu > a");

  dropdownItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      e.preventDefault();
      const parent = this.parentElement;
      parent.classList.toggle("open");

      // Close other opened menus
      document.querySelectorAll(".has-submenu.open").forEach((openItem) => {
        if (openItem !== parent) {
          openItem.classList.remove("open");
        }
      });
    });
  });

  // Auto-expand the active submenu on page load
  const currentPage = window.location.pathname.split("/").pop() || "index.html";
  const activeLink = document.querySelector(`.sidebar a[href="${currentPage}"]`);
  if (activeLink) {
    activeLink.classList.add("active");
    const parentSubmenu = activeLink.closest(".has-submenu");
    if (parentSubmenu) {
      parentSubmenu.classList.add("open");
    }
  }
});

