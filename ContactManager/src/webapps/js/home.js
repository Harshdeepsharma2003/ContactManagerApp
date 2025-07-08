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

// Table Filtering with Favourites filter support
function filterTable() {
    const input = document.getElementById("searchInput");
    const filter = input.value.toLowerCase();
    const table = document.getElementById("contactsTable");
    const trs = table.getElementsByTagName("tr");
    const favOnly = document.getElementById("favouritesOnly").checked;
    for (let i = 1; i < trs.length; i++) {
        const tr = trs[i];
        let show = false;
        const tds = tr.getElementsByTagName("td");
        for (let j = 0; j < tds.length - 2; j++) { // exclude favourite & actions columns
            if (tds[j] && tds[j].innerText.toLowerCase().indexOf(filter) > -1) {
                show = true;
                break;
            }
        }
        // If favourites filter is on, only show if data-favourite="true"
        if (favOnly && tr.getAttribute("data-favourite") !== "true") {
            show = false;
        }
        tr.style.display = show ? "" : "none";
    }
}

// Trigger filterTable on favourites checkbox change
function filterFavourites() {
    filterTable();
}
