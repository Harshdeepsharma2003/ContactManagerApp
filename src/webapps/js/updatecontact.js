
    function validateForm() {
        const name = document.getElementById('name').value.trim();
        const phone = document.getElementById('phone').value.trim();
        const email = document.getElementById('email').value.trim();
        const address = document.getElementById('address').value.trim();
        const category = document.getElementById('category').value;

        const messageDiv = document.getElementById('formMessage');
        messageDiv.textContent = '';
        messageDiv.className = '';

        if (name.length < 2) {
            messageDiv.textContent = 'Name must be at least 2 characters.';
            messageDiv.className = 'error';
            return false;
        }

        // Basic phone validation (digits, spaces, +, -, parentheses)
        const phonePattern = /^[0-9+\-\s()]{6,20}$/;
        if (!phonePattern.test(phone)) {
            messageDiv.textContent = 'Please enter a valid phone number.';
            messageDiv.className = 'error';
            return false;
        }

        // Email validation
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            messageDiv.textContent = 'Please enter a valid email address.';
            messageDiv.className = 'error';
            return false;
        }

        if (address.length < 3) {
            messageDiv.textContent = 'Address must be at least 3 characters.';
            messageDiv.className = 'error';
            return false;
        }

        if (category === '') {
            messageDiv.textContent = 'Please select a category.';
            messageDiv.className = 'error';
            return false;
        }

        return true;
    }
