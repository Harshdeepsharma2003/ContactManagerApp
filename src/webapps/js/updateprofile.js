
    function validateForm() {
        const username = document.getElementById('username').value.trim();
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const messageDiv = document.getElementById('formMessage');

        messageDiv.innerHTML = '';
        messageDiv.className = '';

        // Username validation
        if (username.length < 3) {
            messageDiv.textContent = 'Username must be at least 3 characters long.';
            messageDiv.className = 'error';
            return false;
        }

        // Email validation (simple regex)
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            messageDiv.textContent = 'Please enter a valid email address.';
            messageDiv.className = 'error';
            return false;
        }

        // Password validation (optional - only if user enters a new password)
        if (password.length > 0) {
            if (password.length < 6) {
                messageDiv.textContent = 'Password must be at least 6 characters long.';
                messageDiv.className = 'error';
                return false;
            }
            if (password !== confirmPassword) {
                messageDiv.textContent = 'Passwords do not match.';
                messageDiv.className = 'error';
                return false;
            }
        }

        // All validations passed
        return true;
    }
