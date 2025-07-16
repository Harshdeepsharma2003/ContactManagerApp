
    function validateForm() {
        const contactIdInput = document.getElementById('contactId');
        const messageDiv = document.getElementById('message');
        messageDiv.textContent = '';
        messageDiv.className = '';

        const contactId = contactIdInput.value.trim();

        if (!contactId || isNaN(contactId) || Number(contactId) < 1) {
            messageDiv.textContent = 'Please enter a valid Contact ID (positive number).';
            messageDiv.className = 'error';
            return false;
        }
        return true;
    }
