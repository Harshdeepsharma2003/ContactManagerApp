// Table Sorting
let sortDirection = {};
function sortTable(n) {
    const table = document.getElementById("contactsTable");
    let rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    switching = true;
    dir = sortDirection[n] === "asc" ? "desc" : "asc";
    sortDirection[n] = dir;
    // Remove sorted classes
    Array.from(table.getElementsByTagName("th")).forEach((th, idx) => {
        th.classList.remove("sorted-asc", "sorted-desc");
        if (idx === n) th.classList.add(dir === "asc" ? "sorted-asc" : "sorted-desc");
    });
    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];
            if (dir === "asc") {
                if (x.innerText.toLowerCase() > y.innerText.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir === "desc") {
                if (x.innerText.toLowerCase() < y.innerText.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount++;
        }
    }
}

function filterContacts() {
    const input = document.getElementById("searchInput").value.trim().toLowerCase();
    const favOnly = document.getElementById("favouritesOnly").checked;
    const table = document.getElementById("contactsTable");
    const trs = table.getElementsByTagName("tr");

    for (let i = 1; i < trs.length; i++) {
        const tr = trs[i];
        const tds = tr.getElementsByTagName("td");

        // Adjust these indices if needed: 0 = contactId, 3 = favourite column
        const contactId = tds[0]?.innerText.toLowerCase() || "";
        const isFavourite = tr.getAttribute("data-favourite") === "true";

        const matchesSearch = !input || contactId.includes(input);
        const matchesFavourite = !favOnly || isFavourite;

        tr.style.display = (matchesSearch && matchesFavourite) ? "" : "none";
    }
}
function filterFavourites() {
    filterContacts();
}
    // Mobile menu toggle
    document.querySelector('.mobile-menu-toggle').addEventListener('click', function() {
      document.querySelector('.nav-menu').classList.toggle('active');
    });

    // Search functionality
    document.getElementById('searchInput').addEventListener('keyup', function() {
      const searchTerm = this.value.toLowerCase();
      const rows = document.querySelectorAll('#contactsTable tbody tr:not(.no-data)');

      rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(searchTerm) ? '' : 'none';
      });
    });

    // View toggle functionality
    document.querySelectorAll('.view-btn').forEach(btn => {
      btn.addEventListener('click', function() {
        document.querySelectorAll('.view-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
      });
    });


