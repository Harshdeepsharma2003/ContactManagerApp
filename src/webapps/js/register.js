
        // Toggle password visibility
        const togglePasswordBtn = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');

        togglePasswordBtn.addEventListener('click', () => {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            togglePasswordBtn.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
        });

        // Basic client-side validation
        function validateRegisterForm() {
            const userid = document.getElementById('userid').value.trim();
            const username = document.getElementById('username').value.trim();
            const password = passwordInput.value;
            const email = document.getElementById('email').value.trim();
            const errorContainer = document.getElementById('errorContainer');

            errorContainer.innerHTML = '';

            if (userid.length < 3) {
                showError('User ID must be at least 3 characters.');
                return false;
            }
            if (username.length < 3) {
                showError('Username must be at least 3 characters.');
                return false;
            }
            if (password.length < 6) {
                showError('Password must be at least 6 characters.');
                return false;
            }
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                showError('Please enter a valid email address.');
                return false;
            }
            return true;
        }

        function showError(message) {
            const errorContainer = document.getElementById('errorContainer');
            errorContainer.innerHTML = `
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${message}</span>
                </div>
            `;
        }
