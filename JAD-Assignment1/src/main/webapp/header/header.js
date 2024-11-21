const menuToggle = document.getElementById('menuToggle');
const navbar = document.getElementById('navbar');
const userActions = document.getElementById('userActions');
const userId = session.getAttribute('id')

if (userId) {
	console.log(userId)
    userActions.innerHTML = `
      	<a href="img/pfp.png">
      	<a href="#" id="logout">Logout</a>
    `;
    document.getElementById('logout').addEventListener('click', function() {
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

