
        // Password toggle functionality
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = this.querySelector('i');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        });

        // Form validation
        function validateRegisterForm() {
            const userid = document.getElementById('userid').value.trim();
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value;
            const email = document.getElementById('email').value.trim();

            // Basic validation
            if (!userid || !username || !password || !email) {
                showError('Please fill in all required fields.');
                return false;
            }

            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showError('Please enter a valid email address.');
                return false;
            }

            // Password validation
            if (password.length < 6) {
                showError('Password must be at least 6 characters long.');
                return false;
            }

            // Show loading state
            const submitBtn = document.querySelector('.register-btn');
            const btnText = submitBtn.querySelector('.btn-text');
            const btnLoader = submitBtn.querySelector('.btn-loader');

            btnText.style.opacity = '0.7';
            btnLoader.style.display = 'block';
            submitBtn.disabled = true;

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

            // Auto-hide error after 5 seconds
            setTimeout(() => {
                errorContainer.innerHTML = '';
            }, 5000);
        }

        // Add input focus effects
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
            });

            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
            });
        });
