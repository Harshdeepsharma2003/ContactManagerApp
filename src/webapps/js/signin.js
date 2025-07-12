// DOM elements
const signinForm = document.getElementById('signinForm');
const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('password');
const signinBtn = document.querySelector('.signin-btn');
const errorContainer = document.getElementById('errorContainer');
const inputs = document.querySelectorAll('input[type="text"], input[type="password"]');

// Initialize the page
document.addEventListener('DOMContentLoaded', function() {
    initializeEventListeners();
    initializeInputValidation();
    initializeFormSubmission();
    initializeAnimations();
});

// Event listeners
function initializeEventListeners() {
    // Password toggle functionality
    togglePassword.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        const icon = this.querySelector('i');
        icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
    });

    // Input focus animations
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });

        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });

    // Social login buttons
    const socialButtons = document.querySelectorAll('.social-btn');
    socialButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const provider = this.classList.contains('google') ? 'Google' : 'Microsoft';
            showNotification(`${provider} login will be implemented soon!`, 'info');
        });
    });

    // Forgot password link
    const forgotPasswordLink = document.querySelector('.forgot-password');
    forgotPasswordLink.addEventListener('click', function(e) {
        e.preventDefault();
        showNotification('Password reset functionality will be implemented soon!', 'info');
    });
}

// Input validation
function initializeInputValidation() {
    const useridInput = document.getElementById('userid');

    useridInput.addEventListener('input', function() {
        const value = this.value.trim();
        const container = this.parentElement;

        if (value.length > 0) {
            if (value.length < 3) {
                setInputState(container, 'error');
            } else {
                setInputState(container, 'success');
            }
        } else {
            setInputState(container, 'default');
        }
    });

    passwordInput.addEventListener('input', function() {
        const value = this.value;
        const container = this.parentElement;

        if (value.length > 0) {
            if (value.length < 6) {
                setInputState(container, 'error');
            } else {
                setInputState(container, 'success');
            }
        } else {
            setInputState(container, 'default');
        }
    });
}

// Set input state (default, success, error)
function setInputState(container, state) {
    container.classList.remove('input-success', 'input-error');

    if (state === 'success') {
        container.classList.add('input-success');
    } else if (state === 'error') {
        container.classList.add('input-error');
    }
}

// Form submission
function initializeFormSubmission() {
    signinForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const userid = document.getElementById('userid').value.trim();
        const password = document.getElementById('password').value;

        // Clear previous errors
        clearErrors();

        // Validate inputs
        if (!validateForm(userid, password)) {
            return;
        }

        // Show loading state
        showLoadingState();

        // Simulate form submission delay
        setTimeout(() => {
            // Actually submit the form
            this.submit();
        }, 1000);
    });
}

// Form validation
function validateForm(userid, password) {
    let isValid = true;

    if (!userid) {
        showFieldError('userid', 'User ID is required');
        isValid = false;
    } else if (userid.length < 3) {
        showFieldError('userid', 'User ID must be at least 3 characters');
        isValid = false;
    }

    if (!password) {
        showFieldError('password', 'Password is required');
        isValid = false;
    } else if (password.length < 6) {
        showFieldError('password', 'Password must be at least 6 characters');
        isValid = false;
    }

    return isValid;
}

// Show field error
function showFieldError(fieldId, message) {
    const field = document.getElementById(fieldId);
    const container = field.parentElement;

    setInputState(container, 'error');

    // Create error message
    let errorMsg = container.querySelector('.field-error');
    if (!errorMsg) {
        errorMsg = document.createElement('div');
        errorMsg.className = 'field-error';
        container.appendChild(errorMsg);
    }

    errorMsg.textContent = message;
    errorMsg.style.display = 'block';
}

// Clear errors
function clearErrors() {
    const fieldErrors = document.querySelectorAll('.field-error');
    fieldErrors.forEach(error => {
        error.style.display = 'none';
    });

    const containers = document.querySelectorAll('.input-container');
    containers.forEach(container => {
        setInputState(container, 'default');
    });
}

// Show loading state
function showLoadingState() {
    signinBtn.classList.add('loading');
    signinBtn.disabled = true;
}

// Hide loading state
function hideLoadingState() {
    signinBtn.classList.remove('loading');
    signinBtn.disabled = false;
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <i class="fas ${type === 'error' ? 'fa-exclamation-triangle' : 'fa-info-circle'}"></i>
        <span>${message}</span>
    `;

    document.body.appendChild(notification);

    // Animate in
    setTimeout(() => {
        notification.classList.add('show');
    }, 100);

    // Remove after 3 seconds
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Initialize animations
function initializeAnimations() {
    // Stagger animation for form elements
    const formElements = document.querySelectorAll('.form-group, .signin-btn, .social-signin');
    formElements.forEach((element, index) => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(20px)';
        element.style.transition = 'all 0.5s ease';

        setTimeout(() => {
            element.style.opacity = '1';
            element.style.transform = 'translateY(0)';
        }, 200 + (index * 100));
    });

    // Parallax effect for background shapes
    document.addEventListener('mousemove', function(e) {
        const shapes = document.querySelectorAll('.floating-shape');
        const mouseX = e.clientX / window.innerWidth;
        const mouseY = e.clientY / window.innerHeight;

        shapes.forEach((shape, index) => {
            const speed = (index + 1) * 0.5;
            const x = (mouseX - 0.5) * speed * 20;
            const y = (mouseY - 0.5) * speed * 20;

            shape.style.transform = `translate(${x}px, ${y}px)`;
        });
    });
}

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    // Enter key to submit form
    if (e.key === 'Enter' && e.target.tagName !== 'BUTTON') {
        e.preventDefault();
        signinForm.dispatchEvent(new Event('submit'));
    }

    // Escape key to clear form
    if (e.key === 'Escape') {
        clearForm();
    }
});

// Clear form
function clearForm() {
    signinForm.reset();
    clearErrors();
    hideLoadingState();
}

// Add CSS for additional states
const additionalStyles = `
    .input-container.input-success input {
        border-color: #10b981;
    }

    .input-container.input-error input {
        border-color: #ef4444;
    }

    .field-error {
        display: none;
        color: #ef4444;
        font-size: 12px;
        margin-top: 4px;
        animation: slideDown 0.3s ease;
    }

    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .notification {
        position: fixed;
        top: 20px;
        right: 20px;
        background: white;
        border-radius: 8px;
        padding: 16px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        gap: 8px;
        z-index: 1000;
        opacity: 0;
        transform: translateX(100%);
        transition: all 0.3s ease;
    }

    .notification.show {
        opacity: 1;
        transform: translateX(0);
    }

    .notification-info {
        border-left: 4px solid #3b82f6;
        color: #3b82f6;
    }

    .notification-error {
        border-left: 4px solid #ef4444;
        color: #ef4444;
    }
`;

// Inject additional styles
const styleSheet = document.createElement('style');
styleSheet.textContent = additionalStyles;
document.head.appendChild(styleSheet);
