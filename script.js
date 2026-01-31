document.addEventListener('DOMContentLoaded', function() {
    const sidebarToggle = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            
            if (window.innerWidth > 768) {
                if (sidebar.style.marginLeft === '-250px') {
                    sidebar.style.marginLeft = '0';
                } else {
                    sidebar.style.marginLeft = '-250px';
                }
            }
        });
    }

    // Toggle switch functionality (Visual only for demo)
    const toggleSwitch = document.querySelector('.switch input');
    if (toggleSwitch) {
        toggleSwitch.addEventListener('change', function() {
            console.log('Toggle switched:', this.checked);
        });
    }

    // Sidebar Dropdown functionality
    const dropdownItems = document.querySelectorAll('.has-submenu > a');
    
    dropdownItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const parent = this.parentElement;
            //close other opened menu
            document.querySelectorAll('.has-submenu.open').forEach(openItem => {
             if (openItem !== parent) openItem.classList.remove('open');
           });

            parent.classList.toggle('open');
        });
    });
});
