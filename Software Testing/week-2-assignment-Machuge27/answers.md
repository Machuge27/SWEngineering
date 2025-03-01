
## 1. What is Functional Testing, and Why is It Important in Software Development?  

**Functional testing** is a type of software testing that verifies whether a system's features work according to specified requirements. It focuses on testing the **business logic**, **user interactions**, and **expected outcomes** of the software.  

### **Importance of Functional Testing:**  
- **Ensures Software Meets Requirements** – Confirms that each function operates as expected.  
- **Enhances User Experience** – Ensures smooth interactions with the system.  
- **Identifies Bugs Early** – Detects functional defects before deployment.  
- **Validates Business Processes** – Confirms that workflows align with user needs.  

**Example:**  
Testing a login page by entering valid and invalid credentials to check whether authentication works correctly.  

---

## 2. Differentiate Between Unit Testing and Integration Testing  

| **Aspect**         | **Unit Testing**                                      | **Integration Testing**                         |
|--------------------|------------------------------------------------------|-----------------------------------------------|
| **Definition**     | Testing individual components or functions in isolation. | Testing interactions between combined modules or components. |
| **Focus**         | Single module, function, or class.                    | Communication and data flow between modules. |
| **Who Performs It?** | Developers (often using test automation frameworks). | Testers or developers. |
| **Example**       | Testing a function that calculates the sum of two numbers. | Verifying that a login module correctly communicates with the authentication database. |

---

## 3. Explain the Purpose of System Testing and Acceptance Testing  

### **System Testing:**  
- Evaluates the entire system as a whole to ensure it meets functional and non-functional requirements.  
- Conducted after integration testing.  
- Focuses on end-to-end scenarios, performance, and security.  

**Example:** Testing an e-commerce website to ensure that users can browse products, add items to a cart, and complete a purchase.  

### **Acceptance Testing:**  
- Conducted to verify whether the system meets business requirements and is ready for deployment.  
- Often performed by end-users or clients.  
- Ensures the software aligns with real-world expectations.  

**Example:** A client testing a new payroll system to ensure it correctly calculates employee salaries before approving it for use.  

### **Contribution to Software Quality:**  
- **System Testing** ensures that the entire system works as expected.  
- **Acceptance Testing** ensures that the final product is **usable, reliable, and meets business goals** before release.  

---

## 4. What is Non-Functional Testing, and How Does It Differ from Functional Testing?  

**Non-functional testing** evaluates software aspects **not related to specific functions**, such as **performance, security, usability, and reliability**.  

### **Key Differences:**  

| **Aspect**            | **Functional Testing**                           | **Non-Functional Testing**                     |
|----------------------|-----------------------------------|--------------------------------|
| **Focus**          | Validating features and functionalities. | Assessing performance, security, usability, etc. |
| **Examples**       | Testing login functionality, payment processing. | Load testing, stress testing, security testing. |
| **Objective**      | Ensures software performs expected tasks. | Ensures software meets quality benchmarks. |
| **When Done?**      | Before non-functional testing. | After functional testing. |

---

## 5. Give Two Examples of Non-Functional Testing and Explain Why They Are Important  

### **1. Performance Testing**  
**Definition:** Measures how a system performs under different conditions (e.g., high user loads).  

**Importance:**  
- Ensures that the application **responds quickly** under load.  
- Helps **prevent crashes** when many users access the system.  

**Example:** Testing a banking app by simulating 100,000 simultaneous logins.  

### **2. Security Testing**  
**Definition:** Identifies vulnerabilities and ensures software is protected from cyber threats.  

**Importance:**  
- Protects sensitive user data from breaches.  
- Ensures compliance with security regulations (e.g., GDPR, HIPAA).  

**Example:** Testing an online shopping website for SQL injection attacks to prevent unauthorized database access.  


