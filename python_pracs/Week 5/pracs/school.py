# Base class representing a generic Person in a school
class Person:
    def __init__(self, name, age):
        # Constructor to initialize name and age
        self.name = name
        self.age = age

    def introduce(self):
        # Method to introduce the person
        print(f"Hi, I am {self.name}, and I am {self.age} years old.")

    def perform_task(self):
        # General method to be overridden by subclasses
        pass  # No specific implementation here, will be defined in subclasses


# Teacher class that inherits from Person
class Teacher(Person):
    def __init__(self, name, age, subject):
        # Inheriting name and age from Person and adding subject
        super().__init__(name, age)  # Call the constructor of Person
        self.subject = subject  # Specific attribute for Teacher

    def teach(self):
        # Teaching method, unique to Teacher
        print(f"Teaching {self.subject}")

    def perform_task(self):
        # Polymorphic method, Teacher 'performs' by teaching
        print("Teaching the class")  # Overriding the perform_task method


# Student class that inherits from Person
class Student(Person):
    def __init__(self, name, age, grade):
        # Inheriting name and age from Person and adding grade
        super().__init__(name, age)  # Call the constructor of Person
        self.grade = grade  # Specific attribute for Student

    def study(self):
        # Study method, unique to Student
        print(f"Studying for grade {self.grade}")

    def perform_task(self):
        # Polymorphic method, Student 'performs' by studying
        print("Studying for exams")  # Overriding the perform_task method


# Encapsulation Example: Class to represent Student with encapsulated grade
class EncapsulatedStudent:
    def __init__(self, name):
        self.name = name
        self.__grade = 0  # Private attribute (encapsulation)

    def set_grade(self, grade):
        # Method to safely set grade, enforcing validation (encapsulation)
        if grade >= 0 and grade <= 100:
            self.__grade = grade
        else:
            print("Invalid grade, please enter a grade between 0 and 100.")

    def get_grade(self):
        # Getter method to access the grade
        return self.__grade


# Abstraction Example: Teacher assigns homework without showing grading process
class TeacherWithHomework:
    def assign_homework(self, homework):
        # Assign homework (abstracted from the actual grading)
        print(f"Homework assigned: {homework}")
        # Grading and other details are abstracted away.


# Creating objects for Teacher, Student, and encapsulated Student
teacher = Teacher("Mr. Smith", 40, "Math")
student = Student("Alice", 16, "A")
encapsulated_student = EncapsulatedStudent("John")

# Demonstrating polymorphism
teacher.perform_task()  # Output: Teaching the class (Teacher's task)
student.perform_task()  # Output: Studying for exams (Student's task)

# Demonstrating inheritance, introducing both Teacher and Student
teacher.introduce()  # Inherited method from Person
student.introduce()  # Inherited method from Person

# Encapsulation Example: Setting and getting the grade of the student
encapsulated_student.set_grade(85)  # Valid grade
print(f"{encapsulated_student.name}'s grade is {encapsulated_student.get_grade()}")  # Output: 85

# Abstraction Example: Teacher assigning homework (without showing grading logic)
teacher_with_homework = TeacherWithHomework()
teacher_with_homework.assign_homework("Math problems on Algebra")  # Output: Homework assigned: Math problems on Algebra
