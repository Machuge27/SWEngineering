// Array of testimonials
const testimonials = [
    {
        text: "EasyMove made our relocation stress-free and efficient. Highly recommended!",
        author: "John Doe",
    },
    {
        text: "The team was professional and handled everything with care. Great experience!",
        author: "Jane Smith",
    },
    {
        text: "From packing to setup, EasyMove exceeded our expectations. Thank you!",
        author: "Michael Brown",
    },
];

let currentTestimonial = 0;
const testimonialText = document.getElementById("testimonial-text");
const testimonialAuthor = document.getElementById("testimonial-author");
const testimonialElement = document.querySelector(".testimonial");

// Function to update testimonial content with animation
function updateTestimonial() {
    // Fade out the current testimonial
    testimonialElement.classList.remove("active");

    // Wait for the fade-out transition to complete
    setTimeout(() => {
        // Update the text and author
        testimonialText.textContent = testimonials[currentTestimonial].text;
        testimonialAuthor.textContent = `- ${testimonials[currentTestimonial].author}`;

        // Fade in the new testimonial
        testimonialElement.classList.add("active");
    }, 500); // Match this duration with the CSS transition duration
}

// Function to show the next testimonial
function nextTestimonial() {
    currentTestimonial = (currentTestimonial + 1) % testimonials.length;
    updateTestimonial();
}

// Function to show the previous testimonial
function prevTestimonial() {
    currentTestimonial =
        (currentTestimonial - 1 + testimonials.length) % testimonials.length;
    updateTestimonial();
}

// Initialize the slider
testimonialElement.classList.add("active"); // Show the first testimonial

// Modal Functionality
const modal = document.getElementById('service-modal');
const closeModal = document.querySelector('.close-modal');

// function showServiceDetails(service) {
//   const modalContent = document.getElementById('modal-content');
//   modalContent.innerHTML = `
//     <h2>${service.charAt(0).toUpperCase() + service.slice(1)} Services</h2>
//     <p>Details about ${service} services will go here.</p>
//   `;
//   modal.style.display = 'flex';
// }
const serviceDetails = {
    moving: {
        title: "Moving Services",
        description: "Our moving services include packing, transportation, and unpacking. We ensure your belongings are handled with care and arrive safely at your new location.",
    },
    housing: {
        title: "Housing Assistance",
        description: "We provide assistance in finding the perfect home for you. Our team will help you navigate the housing market, schedule viewings, and handle all the paperwork.",
    },
    setup: {
        title: "Home Setup",
        description: "Our home setup services include furniture assembly, installation of appliances, and organizing your new space. We make sure your new home is ready for you to move in and start living comfortably.",
    },
};

function showServiceDetails(service) {
    const modalContent = document.getElementById('modal-content');
    const details = serviceDetails[service];
    modalContent.innerHTML = `
        <h2>${details.title}</h2>
        <p>${details.description}</p>
    `;
    modal.style.display = 'flex';
}

closeModal.addEventListener('click', () => {
  modal.style.display = 'none';
});

window.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.style.display = 'none';
  }
});

// Hamburger Menu Toggle
const navToggle = document.querySelector('.nav-toggle');
const navMenu = document.querySelector('.nav-menu');

navToggle.addEventListener('click', () => {
    navMenu.classList.toggle('active');
    navToggle.classList.toggle('active');
});

// Close menu when a link is clicked (optional)
const navLinks = document.querySelectorAll('.nav-link');
navLinks.forEach(link => {
    link.addEventListener('click', () => {
        navMenu.classList.remove('active');
        navToggle.classList.remove('active');
        link.classList.add('active');
    });
});


function handleContactForm(event) {
    //event.preventDefault();
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const subject = document.getElementById('subject').value.trim();
    const message = document.getElementById('message').value.trim();

    if (!name || !email || !subject || !message) {
        showMessageBox('error', 'Please fill in all fields.');
        return false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        showMessageBox('error', 'Please enter a valid email address.');
        return false;
    }

    showMessageBox('success', 'Message sent successfully!');
    return true;
}

function showMessageBox(type, message) {
    const box = document.getElementById(type === 'error' ? 'error-box' : 'success-box');
    const messageContainer = type === 'error' ? document.getElementById('error-message') : document.getElementById('success-message');
    messageContainer.textContent = message;
    box.classList.remove('hidden');
}

function closeMessageBox(boxId) {
    document.getElementById(boxId).classList.add('hidden');
}


