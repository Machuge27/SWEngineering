// Part 2: JavaScript Functions

// Function with parameters and return value
function calculateArea(width, height) {
    // Convert input to numbers and check if they're valid
    const w = parseFloat(width);
    const h = parseFloat(height);
    
    if (isNaN(w) || isNaN(h) || w <= 0 || h <= 0) {
        return 'Invalid input';
    }
    
    return w * h;
}

// Function demonstrating scope
function initializeGallery() {
    // Global variable accessible throughout the function
    const gallery = document.querySelector('.gallery');
    
    function handleCardClick(event) {
        // Local variable only accessible in this function
        const card = event.currentTarget;
        toggleCardFlip(card);
    }
    
    // Add click listeners to all cards
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('click', handleCardClick);
    });
}

// Function to toggle CSS class for animation
function toggleCardFlip(card) {
    // Remove flipped class from all other cards
    document.querySelectorAll('.card.flipped').forEach(flippedCard => {
        if (flippedCard !== card) {
            flippedCard.classList.remove('flipped');
        }
    });
    
    // Toggle the flipped class on the clicked card
    card.classList.toggle('flipped');
}

// Part 3: Combining CSS Animations with JavaScript

// Modal functionality
function initializeModal() {
    const modal = document.getElementById('modal');
    const toggleBtn = document.getElementById('toggle-modal');
    const closeBtn = document.getElementById('close-modal');
    
    function showModal() {
        modal.classList.add('show');
    }
    
    function hideModal() {
        modal.classList.remove('show');
        // Force a reflow to reset the animation
        void modal.offsetWidth;
    }
    
    toggleBtn.addEventListener('click', showModal);
    closeBtn.addEventListener('click', hideModal);
    modal.addEventListener('click', (e) => {
        if (e.target === modal) hideModal();
    });
}

// Calculator functionality
function initializeCalculator() {
    const calculateBtn = document.getElementById('calculate-btn');
    const widthInput = document.getElementById('width');
    const heightInput = document.getElementById('height');
    const resultSpan = document.getElementById('area-result');
    
    calculateBtn.addEventListener('click', () => {
        const area = calculateArea(widthInput.value, heightInput.value);
        resultSpan.textContent = typeof area === 'number' ? area.toFixed(2) : area;
    });
}

// Initialize everything when the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    initializeGallery();
    initializeModal();
    initializeCalculator();
});