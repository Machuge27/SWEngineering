// Part 1: JavaScript Basics

// 1. Variables and Data Types
let name = "John Doe"; // String
let age = 25;          // Number
let isStudent = true;  // Boolean
let hobbies = ["Reading", "Coding", "Gaming"]; // Array
let user = { name: "John Doe", age: 25 }; // Object
let dynamicContentDiv = document.getElementById("dynamic-content");

// Logging values and types
console.log(`Name: ${name} (Type: ${typeof name})`);
console.log(`Age: ${age} (Type: ${typeof age})`);
console.log(`Is student: ${isStudent} (Type: ${typeof isStudent})`);
console.log(`Hobbies: ${hobbies} (Type: ${typeof hobbies})`);
console.log(`User: ${JSON.stringify(user)} (Type: ${typeof user})`);

// 2. Operators - Simple Calculator
function calculator() {
    let num1 = parseFloat(prompt("Enter the first number:"));
    let num2 = parseFloat(prompt("Enter the second number:"));
    let operation = prompt("Choose an operation (+, -, *, /):");

    if (isNaN(num1) || isNaN(num2)) {
        alert("Please enter valid numbers.");
        return;
    }

    let result;
    switch (operation) {
        case "+":
            result = num1 + num2;
            break;
        case "-":
            result = num1 - num2;
            break;
        case "*":
            result = num1 * num2;
            break;
        case "/":
            result = num2 !== 0 ? num1 / num2 : "Cannot divide by zero";
            break;
        default:
            alert("Invalid operation selected.");
            return;
    }
    alert(`Result: ${result}`);
}

// 3. Functions - Greeting
function greetUser() {
    let name = prompt("Enter your name:");
    let greetingElement = document.createElement("p");
    let greetingMessage = `Hello, ${name}! Welcome to the JavaScript.`;
    greetingElement.className = "output";
    greetingElement.textContent = greetingMessage;
    dynamicContentDiv.appendChild(greetingElement);
}



// Part 2: JavaScript Control Structures

// 4. If Statements - Voting Eligibility
function checkVotingEligibility() {
    let userAge = parseInt(prompt("Enter your age:"));

    if (isNaN(userAge)) {
        alert("Please enter a valid age.");
        return;
    }

    let eligibilityMessage = userAge >= 18 ? "You are eligible to vote." : "You are not eligible to vote.";
    let eligibilityElement = document.createElement("p");
    eligibilityElement.textContent = eligibilityMessage;
    dynamicContentDiv.appendChild(eligibilityElement);
}

// 5. Loops - Display Numbers
let numberList = document.getElementById("number-list");
for (let i = 1; i <= 10; i++) {
    let listItem = document.createElement("li");
    listItem.textContent = i;
    numberList.appendChild(listItem);
}

// Part 3: Introduction to the DOM

// 6. Creating HTML Structure
// This part is already done in the HTML file.

document.addEventListener("DOMContentLoaded", function() {
    setTimeout(function() {
        // 7. Selecting and Modifying HTML Elements
        // Change the text of the <h1> element
        let heading = document.querySelector("h1");
        heading.textContent = "JavaScript in Action!";

        // Add a new paragraph inside the dynamic-content div
        let newParagraph = document.createElement("p");
        // Adding a new <p> inside the dynamic-content <div>
        newParagraph.textContent = "This content was added dynamically using JavaScript.";
        dynamicContentDiv.appendChild(newParagraph);
    }, 2000);
});
