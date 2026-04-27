// ==========================================
// CONFIGURATION
// ==========================================
// Update this when your backend is running (e.g., http://127.0.0.1:5000/api)
const API_BASE_URL = 'http://localhost:3000/api'; 

// ==========================================
// ROUTER
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    const path = window.location.pathname;

    // Route logic based on your exact filenames
    if (path.includes('login.html') || path === '/' || path.includes('index.html')) {
        initLogin();
    } else if (path.includes('students.html')) {
        // Targets the <tbody> inside your .table-wrap div
        initDynamicTable('/students'); 
    } else if (path.includes('seating-plan.html') || path.includes('seating-plant.html')) {
        initDynamicTable('/seating-plan');
    }
});

// ==========================================
// LOGIN INTERCEPTOR
// ==========================================
function initLogin() {
    const usnInput = document.getElementById('usn');
    const passwordInput = document.getElementById('password');
    const roleButtons = document.querySelectorAll('.role-button');

    // Since your login uses <a> links, we intercept the click
    roleButtons.forEach(button => {
        button.addEventListener('click', async (e) => {
            e.preventDefault(); // Stop the link from redirecting immediately
            
            const targetDashboard = button.getAttribute('href');
            const usn = usnInput.value.trim();
            const password = passwordInput.value;

            if (!usn || !password) {
                alert("Please enter both USN and Password to continue.");
                return;
            }

            // Optional: Replace this block with an actual fetch() call to your backend later
            console.log(`Authenticating ${usn}...`);
            
            // Simulating a successful login and storing USN in local storage
            localStorage.setItem('currentUser', usn);
            
            // Proceed to the dashboard the user clicked
            window.location.href = targetDashboard;
        });
    });
}

// ==========================================
// DYNAMIC TABLE POPULATOR
// ==========================================
async function initDynamicTable(endpoint) {
    // Finds the table body in your exact HTML structure
    const tableBody = document.querySelector('.table-wrap tbody');
    
    if (!tableBody) return;

    try {
        // Comment out this fetch block if you just want to keep the hardcoded HTML data for now
        /*
        const response = await fetch(`${API_BASE_URL}${endpoint}`);
        const data = await response.json();
        
        if (response.ok) {
            tableBody.innerHTML = ''; // Clears your hardcoded sample rows
            
            data.forEach(item => {
                const row = document.createElement('tr');
                const values = Object.values(item);
                row.innerHTML = values.map(val => `<td>${val}</td>`).join('');
                tableBody.appendChild(row);
            });
        }
        */
        console.log(`Dynamic table logic ready for ${endpoint}. Connect backend to overwrite static HTML rows.`);
    } catch (error) {
        console.error(
