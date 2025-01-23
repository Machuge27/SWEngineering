"""
Assignment 1: Design Your Own Class! 🏗️
Create a class representing anything you like (a Smartphone, Book, or even a Superhero!).
Add attributes and methods to bring the class to life!
Use constructors to initialize each object with unique values.
Add an inheritance layer to explore polymorphism or encapsulation.

Activity 2: Polymorphism Challenge! 🎭
Create a program that includes animals or vehicles with the same action (like move()). 
However, make each class define move() differently (for example, Car.move() prints "Driving" 🚗, while Plane.move() prints "Flying" ✈️).

"""

# Assignment 1: Design Your Own Class! 🏗️

class Superhero:
    def __init__(self, name, power, weakness):
        self.name = name
        self.power = power
        self.weakness = weakness

    def display_info(self):
        return f"Superhero: {self.name}, Power: {self.power}, Weakness: {self.weakness}"

class FlyingSuperhero(Superhero):
    def __init__(self, name, power, weakness, flight_speed):
        super().__init__(name, power, weakness)
        self.flight_speed = flight_speed
    """
        This is the constructor method for a derived class (FlyingSuperhero). It extends the base class by adding an additional attribute flight_speed.super().__init__(name, power, weakness) calls the constructor of the base class (BaseClass) to initialize the name, power, and weakness attributes.self.flight_speed = flight_speed initializes the additional attribute flight_speed specific to the FlyingSuperhero.
    """    

    def display_info(self):
        return f"Superhero: {self.name}, \n\t Power: {self.power}, \n\t Weakness: {self.weakness}, Flight Speed: {self.flight_speed} km/h"

# Activity 2: Polymorphism Challenge! 🎭

class Animal:
    def move(self):
        pass

class Dog(Animal):
    def move(self):
        return "Running 🐕"

class Bird(Animal):
    def move(self):
        return "Flying 🐦"

class Fish(Animal):
    def move(self):
        return "Swimming 🐟"

# Example usage
superhero = FlyingSuperhero("Superman", "Super Strength", "Kryptonite", 300)
print(superhero.display_info())

dog = Dog()
bird = Bird()
fish = Fish()

print(dog.move())
print(bird.move())
print(fish.move())