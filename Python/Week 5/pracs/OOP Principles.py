from abc import ABC, abstractmethod

"""
OOP Principles
1. Encapsulation

Encapsulation is the bundling of data (attributes) and methods (functions) that operate on the data into a single unit called a class. It is a way to restrict access to certain parts of an object and protect the data from external interference or misuse. Encapsulation helps in maintaining the integrity of the data and ensures that it is accessed and modified in a controlled manner.

2. Inheritance

Inheritance is a mechanism in object-oriented programming that allows a new class (derived class) to inherit attributes and methods from an existing class (base class). The derived class can extend or modify the behavior of the base class by adding new attributes or methods, or by overriding existing methods. Inheritance promotes code reusability and helps in creating a hierarchy of classes with shared characteristics.

3. Polymorphism

Polymorphism is the ability of an object to take on multiple forms. In object-oriented programming, polymorphism allows objects of different classes to be treated as objects of a common superclass. This enables the same method to be called on different objects, resulting in different behaviors based on the type of object. Polymorphism is achieved through method overriding, where a method in a subclass overrides the implementation of the same method in the superclass.

4. Abstraction

Abstraction is the process of hiding the implementation details of an object and exposing only the essential features or functionalities to the outside world. It allows the user to interact with the object without needing to know the internal workings or complexities of the object. Abstraction helps in simplifying the interface of an object and focusing on the essential aspects, making the object easier to use and understand.

5. Composition

Composition is a design technique in object-oriented programming where objects are composed of other objects as parts. It allows for the creation of complex objects by combining simpler objects together. Composition is a form of object aggregation, where the composed objects are treated as parts of the containing object. It promotes code reuse, modularity, and flexibility in designing complex systems.

6. Association

Association is a relationship between two or more classes that describes how objects of one class are connected to objects of another class. It represents a more general form of relationship than inheritance, where objects of different classes interact with each other to perform a specific task. Association can be one-to-one, one-to-many, or many-to-many, depending on the cardinality of the relationship between the classes. It helps in modeling real-world scenarios and interactions between objects in a system.

7. Aggregation

Aggregation is a form of association where one class contains objects of another class as part of its structure. It represents a whole-part relationship, where the contained objects are independent entities that can exist on their own. Aggregation is a weaker form of relationship than composition, as the contained objects can be shared among multiple containing objects. It promotes code reuse, modularity, and flexibility in designing complex systems.

8. Dependency

Dependency is a relationship between two classes where one class depends on the other class to perform a specific task. It occurs when a class uses objects or methods of another class to fulfill its functionality. Dependency is a temporary relationship that exists only during the execution of a specific operation or task. It helps in reducing coupling between classes and promoting code modularity and reusability.

9. Association vs. Aggregation vs. Composition

Association, aggregation, and composition are different forms of relationships between classes in object-oriented programming. Association represents a general relationship between classes, where objects of one class are connected to objects of another class. Aggregation is a form of association where one class contains objects of another class as part of its structure. Composition is a stronger form of aggregation, where the contained objects are owned by the containing object and have a lifecycle dependent on the containing object.

10. Encapsulation vs. Abstraction

Encapsulation and abstraction are two key principles in object-oriented programming that help in designing and implementing classes and objects. Encapsulation is the bundling of data and methods into a single unit (class) to protect

"""

# Implementation of OOP Principles


# Encapsulation Example: 
class SecretStash:
    def __init__(self):
        self.__chocolates = 10  # Private attribute

    def take_chocolate(self):
        if self.__chocolates > 0:
            self.__chocolates -= 1
            print("One chocolate taken!")
        else:
            print("No chocolates left 😢")

stash = SecretStash()
stash.take_chocolate()

# Inheritance Example: 

class Vehicle:
    def __init__(self, wheels):
        self.wheels = wheels

class Car(Vehicle):
    pass

car = Car(4)
print(car.wheels)  # Output: 4

# Polymorphism Example: Method overriding in derived class

class Dog:
    def speak(self):
        return "Woof!"

class Cat:
    def speak(self):
        return "Meow!"

# Polymorphism in action
for animal in [Dog(), Cat()]:
    print(animal.speak())

# Abstraction Example: Abstract class with abstract method


class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * self.radius * self.radius

# Composition Example: Class that uses other classes as part of its structure

class Engine:
    def start(self):
        return "Engine started"

class Car:
    def __init__(self):
        self.engine = Engine()

    def start(self):
        return self.engine.start()

car = Car()
print(car.start())


# Association Example: Relationship between Teacher and Course

class Teacher:
    def __init__(self, name):
        self.name = name

class Course:
    def __init__(self, title, teacher):
        self.title = title
        self.teacher = teacher

teacher = Teacher("Mr. Smith")
course = Course("Math", teacher)
print(course.teacher.name) # Output: Mr. Smith

# Aggregation Example: Library containing Books

class Book:
    def __init__(self, title):
        self.title = title

class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)

library = Library()
book1 = Book("Python Programming")
book2 = Book("Data Structures")
library.add_book(book1)
library.add_book(book2)
for book in library.books:
    print(book.title)

# Dependency Example: Class that depends on another class to perform a task

class Printer:
    def print_document(self, document):
        print(f"Printing: {document}")

class Computer:
    def __init__(self, printer):
        self.printer = printer

    def print(self, document):
        self.printer.print_document(document)

printer = Printer()
computer = Computer(printer)
computer.print("Hello, World!")


