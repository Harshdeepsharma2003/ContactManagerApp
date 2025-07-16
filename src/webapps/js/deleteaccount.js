
    function validateForm() {
        const userId = document.getElementById('userId').value.trim();
        const password = document.getElementById('password').value.trim();
        const messageDiv = document.getElementById('message');

        messageDiv.textContent = '';
        messageDiv.className = '';

        if (userId.length === 0) {
            messageDiv.textContent = 'User ID is required.';
            messageDiv.className = 'error';
            return false;
        }

        if (password.length === 0) {
            messageDiv.textContent = 'Password is required.';
            messageDiv.className = 'error';
            return false;
        }

        // Additional validations can be added here if needed

        return true; // Allow form submission
    }
