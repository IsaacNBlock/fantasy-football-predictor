// Global variable to store coefficients
let coefficients = null;

// Load coefficients when page loads
document.addEventListener('DOMContentLoaded', async function() {
    try {
        const response = await fetch('model_coefficients.json');
        coefficients = await response.json();
        console.log('Coefficients loaded successfully');
    } catch (error) {
        console.error('Error loading coefficients:', error);
        alert('Error loading model coefficients. Please make sure model_coefficients.json is available.');
    }
});

// Tab switching function
function switchTab(position) {
    // Hide all tab contents
    const tabContents = document.querySelectorAll('.tab-content');
    tabContents.forEach(content => {
        content.classList.remove('active');
    });

    // Remove active class from all tab buttons
    const tabButtons = document.querySelectorAll('.tab-button');
    tabButtons.forEach(button => {
        button.classList.remove('active');
    });

    // Show selected tab content
    document.getElementById(position).classList.add('active');
    
    // Add active class to clicked button
    event.target.classList.add('active');
}

// Main prediction calculation function
function calculatePrediction(position) {
    if (!coefficients) {
        alert('Model coefficients not loaded yet. Please wait a moment and try again.');
        return;
    }

    const positionCoeffs = coefficients[position];
    if (!positionCoeffs) {
        alert(`Coefficients for ${position} not found.`);
        return;
    }

    // Get input values based on position
    let inputs = {};
    const form = document.getElementById(`${position.toLowerCase()}-form`);
    const inputsList = form.querySelectorAll('input[type="number"]');
    const positionPrefix = position.toLowerCase() + '_';

    inputsList.forEach(input => {
        // Remove position prefix from input ID to get variable name
        const varName = input.id.startsWith(positionPrefix) 
            ? input.id.substring(positionPrefix.length) 
            : input.id;
        let value = parseFloat(input.value) || 0;
        inputs[varName] = value;
    });

    // Calculate prediction using linear regression formula
    let prediction = positionCoeffs['(Intercept)'] || 0;

    // Iterate through all coefficients and multiply by input values
    for (const [varName, coefficient] of Object.entries(positionCoeffs)) {
        if (varName === '(Intercept)') continue;
        
        // Get input value for this variable (default to 0 if not provided)
        const inputValue = inputs[varName] || 0;
        prediction += coefficient * inputValue;
    }

    // Display result
    const resultDiv = document.getElementById(`${position.toLowerCase()}-result`);
    resultDiv.innerHTML = `
        <div class="result-box">
            <h3>Predicted Fantasy Points</h3>
            <div class="prediction-value">${prediction.toFixed(2)}</div>
            <p class="result-note">Based on the trained linear regression model</p>
        </div>
    `;

    // Scroll to result
    resultDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
}

