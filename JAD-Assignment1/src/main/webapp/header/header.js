const menuToggle = document.getElementById('menuToggle');
const navbar = document.getElementById('navbar');
const userActions = document.getElementById('userActions');
const userId = localStorage.getItem('user_id');

if (userId) {
    userActions.innerHTML = `
      	<a href="img/pfp.png">
      	<a href="#" id="logout">Logout</a>
    `;
    document.getElementById('logout').addEventListener('click', function() {
      	localStorage.removeItem('user_id');
      	window.location.reload();
    });
} else {
    userActions.innerHTML = `
    	<a href="login.jsp">Login</a>
    	<a href="register.jsp">Register</a>
    `;
}

menuToggle.addEventListener('click', function () {
    navbar.classList.toggle('active');
});

