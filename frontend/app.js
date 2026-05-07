/**
 * Exam Room Allocation System - Integrated Logic
 * Handles UI, API interactions, and Search Filtering
 */

document.addEventListener('DOMContentLoaded', () => {
    // --- 1. GLOBAL SELECTORS ---
    const searchBox = document.querySelector('.search-box');
    const tableRows = document.querySelectorAll('tbody tr');
    const actionButtons = document.querySelectorAll('.primary-button, .admin-button');
    const sidebarLinks = document.querySelectorAll('.nav-links a');

    // --- 2. LIVE SEARCH ENGINE ---
    // Instantly filters tables on Admin, Teacher, and Student pages
    if (searchBox) {
        searchBox.addEventListener('input', function(e) {
            const query = e.target.value.toLowerCase();
            let visibleRows = 0;

            tableRows.forEach(row => {
                const content = row.innerText.toLowerCase();
                const isMatch = content.includes(query);
                row.style.display = isMatch ? '' : 'none';
                if (isMatch) visibleRows++;
            });

            toggleNoResults(visibleRows === 0);
        });
    }

    // --- 3. DYNAMIC SIDEBAR INTERACTION ---
    // Ensures the active state stays visual during the session
    sidebarLinks.forEach(link => {
        link.addEventListener('click', () => {
            sidebarLinks.forEach(l => l.classList.remove('active'));
            link.classList.add('active');
        });
    });

    // --- 4. BUTTON LOADING STATES ---
    // Prevents double-submission and gives UX feedback
    actionButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            // Only add loader for buttons that trigger actions
            if (this.type === 'submit' || this.classList.contains('admin-button')) {
                const originalText = this.innerHTML;
                this.style.width = `${this.offsetWidth}px`; // Maintain layout
                this.innerHTML = `<span class="spinner"></span> Processing...`;
                this.style.pointerEvents = 'none';
                this.style.opacity = '0.7';
            }
        });
    });

    // --- 5. ALLOCATION API CALL (ADMIN ONLY) ---
    // Connects to your Flask /api/allocate route
    window.runAllocation = async () => {
        const confirmMsg = "Generate new seating plan? This will overwrite previous data.";
        if (!confirm(confirmMsg)) return;

        try {
            const response = await fetch('/api/allocate', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' }
            });

            const data = await response.json();

            if (data.success) {
                showToast("Seating Plan Generated Successfully!", "success");
                setTimeout(() => window.location.reload(), 1500);
            } else {
                showToast("Allocation Error: " + data.error, "error");
            }
        } catch (err) {
            console.error("Connection Error:", err);
            showToast("Server Connection Failed.", "error");
        }
    };

    // --- 6. UTILITY FUNCTIONS ---

    function toggleNoResults(isEmpty) {
        const tbody = document.querySelector('tbody');
        let emptyRow = document.getElementById('empty-search-row');

        if (isEmpty) {
            if (!emptyRow) {
                emptyRow = document.createElement('tr');
                emptyRow.id = 'empty-search-row';
                emptyRow.innerHTML = `<td colspan="100%" style="text-align:center; padding:2rem; color:var(--muted);">No matching records found.</td>`;
                tbody.appendChild(emptyRow);
            }
        } else if (emptyRow) {
            emptyRow.remove();
        }
    }

    function showToast(message, type) {
        const toast = document.createElement('div');
        toast.className = `flash-message ${type}`;
        toast.style.cssText = `
            position: fixed; bottom: 24px; right: 24px; 
            z-index: 9999; box-shadow: var(--shadow);
            padding: 16px 24px; border-radius: 12px;
            animation: slideUp 0.3s ease-out;
        `;
        toast.innerText = message;
        document.body.appendChild(toast);
        setTimeout(() => toast.remove(), 4000);
    }
});
