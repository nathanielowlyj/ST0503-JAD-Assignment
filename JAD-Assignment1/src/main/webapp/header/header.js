document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.getElementById('menuToggle');
    const navbar = document.getElementById('navbar');

    menuToggle.addEventListener('click', function () {
        navbar.classList.toggle('active');
    });

    // Cookie Retrieval
    function getCookie(name) {
        const cookies = document.cookie.split(';');
        for (let cookie of cookies) {
            const [key, value] = cookie.trim().split('=');
            if (key === name) {
                return decodeURIComponent(value);
            }
        }
        return null;
    }

    const userId = getCookie('userId');
    const userRole = getCookie('userRole');

    // Update User Actions
    const userActions = document.getElementById('userActions');
    if (userId) {
        console.log(`User ID: ${userId}`);
        console.log(`User Role: ${userRole}`);
        userActions.innerHTML = `
            <a href="img/pfp.png">Profile</a>
            <a href="#" id="logout">Logout</a>
        `;
        document.getElementById('logout').addEventListener('click', function () {
            document.cookie = "userId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "userRole=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.reload();
        });
    } else {
        userActions.innerHTML = `
            <a href="/JAD-Assignment1/login.jsp">Login</a>
            <a href="/JAD-Assignment1/register.jsp">Register</a>
        `;
    }
});
