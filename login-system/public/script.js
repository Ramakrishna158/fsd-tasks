const form = document.getElementById("loginForm");

form.addEventListener("submit", async function(e) {
    e.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    let valid = true;

    document.getElementById("emailError").textContent = "";
    document.getElementById("passwordError").textContent = "";
    document.getElementById("serverMessage").textContent = "";

    if (!email) {
        document.getElementById("emailError").textContent = "Email is required";
        valid = false;
    }

    if (!password) {
        document.getElementById("passwordError").textContent = "Password is required";
        valid = false;
    }

    if (!valid) return;

    const response = await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password })
    });

    const data = await response.json();

    const msg = document.getElementById("serverMessage");

    if (data.success) {
        msg.style.color = "lightgreen";
        msg.textContent = data.message;
    } else {
        msg.style.color = "red";
        msg.textContent = data.message;
    }
});