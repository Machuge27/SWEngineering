
### **1. What is TensorFlow, and what are its key features?**  
**TensorFlow** is an open-source machine learning framework developed by **Google**, widely used for building and training deep learning models.  

**Key Features:**
- **Flexibility:** Supports both high-level (Keras) and low-level APIs.  
- **Scalability:** Runs on CPUs, GPUs, and TPUs.  
- **Comprehensive Ecosystem:** Includes **TensorFlow Lite** (for mobile), **TensorFlow.js** (for web), and **TFX** (for production).  

---

### **2. What is the main difference between TensorFlow and PyTorch in terms of computation graphs?**  
- **TensorFlow** initially used a **static computation graph**, meaning the graph is defined before execution and cannot be changed dynamically.  
- **PyTorch** uses a **dynamic computation graph**, allowing flexibility where the graph is built on the fly during execution.  

---

### **3. What is Keras, and on which frameworks can it run?**  
**Keras** is a high-level neural networks API designed for quick experimentation with deep learning models.  

**Frameworks Keras can run on:**
- **TensorFlow**  
- **Theano**  
- **CNTK (Microsoft Cognitive Toolkit)**  

---

### **4. What are the key features of Scikit-learn?**  
**Scikit-learn** is a Python machine learning library that provides tools for data mining and data analysis.  

**Key Features:**
- **Wide Range of Algorithms:** Supports **classification, regression, clustering, and dimensionality reduction**.  
- **Ease of Use:** Simple and consistent API with extensive documentation.  
- **Integration:** Works well with **NumPy, SciPy, and Matplotlib**.  

---

### **5. What is the purpose of Jupyter Notebooks, and what are its key features?**  
**Jupyter Notebooks** is an open-source web application for creating and sharing documents that contain code, equations, visualizations, and text.  

**Key Features:**
- **Interactive Execution:** Allows running code step-by-step in cells.  
- **Multi-Language Support:** Primarily for Python but also supports R, Julia, and more.  
- **Rich Output:** Supports visualization, markdown text, and inline plots.  

---

### **6. In the TensorFlow example provided, what is the purpose of the Dropout layer in the neural network?**  
The **Dropout** layer (`layers.Dropout(0.2)`) is used for **regularization** to prevent overfitting. It randomly drops a fraction of neurons (in this case, 20%) during training, ensuring the model does not rely too much on specific neurons.  

---

### **7. What is the role of the optimizer in the PyTorch example, and which optimizer is used?**  
The optimizer in PyTorch updates model parameters to minimize the loss function.  

**Optimizer used:** `Adam` (`optim.Adam(model.parameters(), lr=0.001)`)  
- It adjusts the learning rate dynamically for each parameter.  
- It combines the advantages of **Momentum** and **RMSProp** optimizers.  

---

### **8. In the Keras example, what is the purpose of the Conv2D layer?**  
The **Conv2D** layer (`layers.Conv2D(32, (3,3), activation='relu')`) is used to extract spatial features from images. It applies **convolutional filters** to detect edges, textures, and patterns in the input image.  

---

### **9. What type of model is used in the Scikit-learn example, and what dataset is it applied to?**  
- **Model Used:** `RandomForestClassifier` (A tree-based ensemble learning algorithm).  
- **Dataset Used:** `Iris dataset` (A famous dataset for flower classification).  

---

### **10. What is the output of the Jupyter Notebook example, and which library is used to generate the visualization?**  
- **Output:** A **sine wave plot**.  
- **Library Used:** `matplotlib.pyplot` (Matplotlib is used to generate the visualization).  

---

### ✅ **Summary of Answers:**  
| **Question** | **Answer** |
|-------------|------------|
| **What is TensorFlow?** | A deep learning framework by Google with flexibility, scalability, and a comprehensive ecosystem. |
| **Difference between TensorFlow & PyTorch graphs?** | TensorFlow uses **static graphs**, PyTorch uses **dynamic graphs**. |
| **What is Keras?** | A high-level deep learning API that runs on TensorFlow, Theano, and CNTK. |
| **Key features of Scikit-learn?** | Supports ML algorithms, easy-to-use API, integrates with NumPy, SciPy, and Matplotlib. |
| **Purpose of Jupyter Notebooks?** | Interactive coding environment supporting multiple languages and rich outputs. |
| **Purpose of Dropout in TensorFlow?** | Prevents overfitting by randomly deactivating neurons during training. |
| **Role of optimizer in PyTorch?** | Adjusts model weights; **Adam optimizer** is used. |
| **Purpose of Conv2D in Keras?** | Extracts spatial features from images using convolutional filters. |
| **Model used in Scikit-learn?** | `RandomForestClassifier` applied to the `Iris` dataset. |
| **Output of Jupyter Notebook example?** | A **sine wave plot**, generated using `matplotlib.pyplot`. |

