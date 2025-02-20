# Import necessary libraries
"""
Usage:
    Run this script to build, train, and evaluate a neural network model on the MNIST dataset.
This script builds and trains a neural network model using TensorFlow and Keras to classify handwritten digits from the MNIST dataset.
Functions:
    None
Imports:
    tensorflow as tf: TensorFlow library for building and training neural networks.
    tensorflow.keras.layers: Module containing layers for building neural networks.
    tensorflow.keras.models: Module containing model classes for building neural networks.
Dataset:
    MNIST dataset: A dataset of handwritten digits (0-9) used for training and testing the neural network model.
Variables:
    X_train (numpy.ndarray): Training images, normalized to the range [0, 1].
    y_train (numpy.ndarray): Training labels.
    X_test (numpy.ndarray): Test images, normalized to the range [0, 1].
    y_test (numpy.ndarray): Test labels.
Model:
    model (tf.keras.Sequential): A sequential neural network model with the following layers:
        - Flatten: Converts each 28x28 image into a 1D array of 784 elements.
        - Dense: A fully connected layer with 128 units and ReLU activation.
        - Dropout: A dropout layer with a rate of 0.2 to prevent overfitting.
        - Dense: A fully connected layer with 10 units (one for each digit).
"""
import tensorflow as tf
from tensorflow.keras import layers, models

#Load the MNIST dataset
mnist = tf.keras.datasets.mnist
(X_train, y_train), (X_test, y_test) = mnist.load_data()

#Normalize the data
X_train, X_test = X_train/255.0, X_test/255.0

#Build the Neural Network model
model = models.Sequential([
    layers.Flatten(input_shape=(28, 28)),
    layers.Dense(128, activation='relu'),
    layers.Dropout(0.2),
    layers.Dense(10, activation='softmax')
])

#compile the model
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

#Train the model
model.fit(X_train, y_train, epochs=5)

#Evaluate the model
model.evaluate(X_test, y_test)
