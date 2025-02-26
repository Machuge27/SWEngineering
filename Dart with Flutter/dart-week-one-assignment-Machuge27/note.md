# Introduction to Dart

![alt](./images/c973e909-7549-4384-9425-47b7c6faef5d.png)

[repo](https://github.com/PLP-Dart-Projects/dart-week-one-assignment-Machuge27.git)

## 🎯 Learning Objectives

By the end of this exciting adventure, you’ll be able to:

- 🌟 Introduce Dart as a modern, object-oriented, and statically typed programming language.
- 🛠 Install the Dart SDK and become a coding wizard using Visual Studio Code.
- 💡 Master basic Dart spells (variables, data types, and operators) with ease.
- 🎮 Control the flow of your programs like a pro with if, else, switch, and loops.

## Introduction to Dart

Welcome, young coder, to the magical land of Dart! ✨

Dart is an open-source programming language developed by the wizards at Google. It’s used to create mobile 📱, web 🌐, and desktop 🖥 apps—and it’s awesome for server-side spells too!

🔐 **Fun Fact:** Dart is a strongly typed language 🧙‍♀️, which means the compiler (your friendly spell-checker 🧹) will find any errors before you even cast the spell! 🧙‍♂️ [Download Dart SDK](https://storage.googleapis.com/dart-archive/channels/stable/release/3.6.2/sdk/dartsdk-windows-x64-release.zip)

## Why Learn Dart?

Dart is not just fun to learn; it’s powerful. You can build amazing things, whether you’re a beginner 🐣 or a seasoned programmer 🦅.

🎮 If you already know languages like C, Java, or JavaScript, then Dart will feel like unlocking a hidden skill tree in your coding journey.

🕹 Let’s dive in!

## Dart Features

Out of the box:

- 🆓 Free and open-source! Yep, you can get started for $0.
- 🏎 Fast: It’s designed for speed—build Android, iOS, web, and desktop apps faster.
- 💻 Code once, run anywhere: Dart can compile into native code or JavaScript! Magic, right?
- 🚀 Null safety & async programming built right in! Write reliable, bug-free code while multitasking like a pro.

## Chapter 2: Installing Dart SDK

### 🎮 Level 1: Installing Dart on Windows

Getting Dart on Windows is a piece of cake 🍰. Ready? Let's go!

1. Download the Dart SDK from the official website 🖱. Head to [Download Dart SDK](https://storage.googleapis.com/dart-archive/channels/stable/release/3.6.2/sdk/dartsdk-windows-x64-release.zip) to download SDK 🎯.
2. Unzip the file and store it somewhere safe—maybe in your “C” drive 🗂.
3. Set the PATH so your command line magic works smoothly:
    - Open Control Panel 🛠.
    - Navigate to System and Security ➡️ System ➡️ Advanced system settings.
    - Click on Environment Variables 🧬.
    - In System Variables, find Path and add the path to Dart’s bin directory (e.g., "C:\dart-sdk\bin").
4. Verification time! Open a command prompt 💻 and type:
    ```sh
    dart --version
    ```
    If you see Dart’s version number, 🎉 congrats! You’ve installed Dart successfully!

### 🖥 Level 2: Installing Dart on macOS 🍏

Apple fans, you're up! 🌟

1. Open Terminal (your coding cauldron 🧙‍♀️) and type:
    ```sh
    brew tap dart-lang/dart
    brew install dart
    ```
2. Once installed, you can double-check with:
    ```sh
    dart --version
    ```

Voila! You’re good to go! 🎉

### Level 3: Installing Dart on Ubuntu

Hey, Linux masters! Let’s install Dart with a few magic lines!

1. Open your terminal 🖥 and run the following commands:
    ```sh
    sudo apt update
    sudo apt install apt-transport-https
    sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
    sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
    sudo apt update
    sudo apt install dart
    ```
2. 🎉 You’re all set! Check your installation by typing:
    ```sh
    dart --version
    ```

## 🏆 Chapter 3: Your First Dart Program

Congratulations, adventurer! 🎉 You’re about to write your first spell in Dart! Let’s write the Hello World program—the “abracadabra” of programming! 🧙‍♀️

1. Open Visual Studio Code 🖥 and create a new folder.
2. Inside your folder, create a file named `hello_world.dart`.
3. Write the following spell 🪄:
    ```dart
    void main() {
      print('Hello, World!');
    }
    ```
4. Now, in VS Code, hit the play button ▶️ to run your program. You should see:
    ```
    Hello, World!
    ```

Congratulations 🎉

## Variables in Dart

Understanding Variables in Dart:

Variables are used to store data that can be used and manipulated throughout your program. In Dart, you can declare variables using `var`, `final`, or `const`. The choice depends on whether the variable's value is intended to be mutable or immutable.

```dart
void main() {
  String wizardName = 'Gandalf';    // 🧙‍♂️ A String spell!
  int magicLevel = 100;             // 💪 Integer magic!
  double spellPower = 75.5;         // 💥 Double trouble!
  bool hasMagicStaff = true;        // 🪄 A magical staff? True or False?
  
  print('Name: $wizardName');
  print('Magic Level: $magicLevel');
  print('Spell Power: $spellPower');
  print('Has Staff: $hasMagicStaff');
  
  // 🔥 Update a variable
  magicLevel = 110;
  print('New Magic Level: $magicLevel');
}
```

## Watch our video on Introduction to Dart

[![alt text](./images/image.png)](https://youtu.be/OwQ__u9jHIs)

## 🎉 What’s Next?

Now that you’ve begun your journey into the world of Dart, the real fun begins! 🚀 From mastering advanced spells (like control flow 🔄 and loops ♻️) to building incredible apps with Flutter 🦋, you’re on your way to becoming a true Dart Wizard! 💫


### Lesson 2 - Data Types in Dart

# 🚀 Mastering Dart Data Types

A data type is an attribute of data which tells the compiler or interpreter how the programmer intends to use the data.

Dart supports the following data types:

- Number
- Strings
- Boolean
- Lists
- Maps
- Runes
- Null

## Chapter 1: Numbers – Arithmetic Coding Magic

Numbers in Dart come in two main forms: `int` for whole numbers and `double` for decimal numbers. Perfect for executing your arithmetic coding wizardry!

```dart
void main() {
    // 🧙‍♂️ Integer code: Whole number magic
    int linesOfCodeWritten = 42;
    int bugsFixed = 10;

    // 💡 Double code: For fractional and decimal precision
    double coffeeCups = 9.5;
    double codingHours = 3.14;  

    // 🧮 Arithmetic coding spells
    int totalProductivity = linesOfCodeWritten + bugsFixed;  // Add
    double codeTime = codingHours * coffeeCups;  // Multiply
    
    print("💻 Total productivity: $totalProductivity tasks completed");
    print("⏳ Coding time: $codeTime hours fueled by coffee");
}
```

🎉 **Fun Fact:** You can mix integers and doubles to power up your math operations!

## Strings

Strings are like the magic scrolls 📜 of your code—they store all your text-based data and messages. With Dart, you can craft and manipulate text using strings!

```dart
void main() {
    // 🔮 Crafting string code
    String coderName = "Ada Lovelace";
    String favoriteLanguage = "Dart";
    String favoriteEmoji = "💻";

    // 🧙‍♀️ Combine strings using string interpolation (the power of `${}`!)
    print("👩‍💻 Hello, my name is $coderName, and I code in $favoriteLanguage $favoriteEmoji");
}
```

💬 **Pro Tip:** String interpolation (`$variable`) is a neat trick to insert variables directly into your text. 

## Booleans

Booleans store the true or false logic of your code—a key ingredient in decision-making!

```dart
void main() {
    // 🌟 Boolean code: True or false logic
    bool isCodingFun = true;
    bool lovesDebugging = false;  // Debugging can be tricky!

    // 🧑‍💻 Making decisions with booleans
    if (isCodingFun) {
        print("🎉 Coding is fun, keep going!");
    } else {
        print("💡 Try a new language or project for more fun!");
    }

    if (lovesDebugging) {
        print("🐛 Debugging is like solving a puzzle!");
    } else {
        print("🚀 Focus on writing bug-free code!");
    }
}
```

🧑‍🏫 **Quick Note:** Booleans are perfect for setting up conditions in your code—true or false decides what happens next!

## Lists

Dart List is similar to an array, which is the ordered collection of the objects. If you want to store multiple values without creating multiple variables, you can use a list.

```dart
void main() {
    // use square brackets for listing
    List myList = [1, 2, 4, "Jackson"];
    // adding value to the list

    myList.add(67);
    myList.remove("Jackson");
    // remove value
    // myList.remove(4);
    print(myList);
}
```

🎯 **Fun Fact:** Lists keep things in a specific order

## Maps

A map is a dynamic collection that represents a set of values ​as key-value pairs. Keys and values ​in the map can be of any type.

```dart
void main() {
    // Creating a Map with String keys and int values
    Map<String, int> ages = {
        'Alice': 30,
        'Bob': 25,
        'Charlie': 35,
    };
    print("Ages of students: $ages");
}
```

🎯 **Fun Fact:** Maps are like labeled boxes where each label (key) stores a specific value!

## Runes

A rune can be defined as an integer used to represent any Unicode code point. As a Dart string is a simple sequence of UTF-16 code units, 32-bit Unicode values in a string are represented using a special syntax.

Every symbol, letter, or emoji you use in Dart has a unique Unicode code point. For example:

- The Unicode for the smiley face 😊 is U+1F60A.
- The Unicode for the heart ❤️ is U+2764.

```dart
void main() {
    // 🧙‍♀️ Summon emojis and symbols using runes
    Runes magicRunes = Runes('\u2764\u1F60A\u1F680');  // ❤️😊🚀

    // 🔮 Decoding the rune spell into a readable string
    String castedMagic = String.fromCharCodes(magicRunes);
    
    // 🔮 Output the magic!
    print("✨ Casting runes: $castedMagic");
}
```

Runes are used to represent Unicode code points in Dart. In this case, we are using `\u2764` (❤️), `\u1F60A` (😊), and `\u1F680` (🚀).

`String.fromCharCodes()` decodes the rune spell (Unicode values) into a readable string, turning the Unicode numbers into their corresponding symbols.

The print statement shows our magic in action, printing out a heart, smiley face, and a rocket! 🚀❤️😊

## Arithmetic Operations using Numbers

Arithmetic operators are the most common types of operators. They perform operations like addition, subtraction, multiplication, division.

```dart
void main() {
    // Declaring integer and double variables
    int a = 10;
    int b = 3;
    double x = 5.5;
    double y = 2.5;

    // Performing arithmetic operations
    int addition = a + b;            // Addition
    int subtraction = a - b;         // Subtraction
    int multiplication = a * b;      // Multiplication
    double division = a / b;         // Division (returns a double)
    int integerDivision = a ~/ b;    // Integer Division (returns an int)
    int modulus = a % b;             // Modulus (remainder of division)

    // Using double variables
    double doubleAddition = x + y;
    double doubleMultiplication = x * y;

    // Printing results
    print('Addition (int): $a + $b = $addition');
    print('Subtraction (int): $a - $b = $subtraction');
    print('Multiplication (int): $a * $b = $multiplication');
    print('Division (double): $a / $b = $division');
    print('Integer Division: $a ~/ $b = $integerDivision');
    print('Modulus: $a % $b = $modulus');

    print('Addition (double): $x + $y = $doubleAddition');
    print('Multiplication (double): $x * $y = $doubleMultiplication');
}
```

🎉 **What’s Next?**

Now that you’ve unlocked the basics of Dart data types, you’re ready to dive deeper! 🚀 Keep practicing, and soon you’ll be writing code like a pro, crafting apps, games, and more with Dart! Keep up the great work, coder!


## 🌟 Control Flow in Dart


In Dart, control flow allows you to decide which direction your code should take, whether to repeat an action, or jump to specific steps. Let's explore the different control flow options in Dart!

⚡️ What is Control Flow?

Control flow statements direct your program to execute or skip parts of the code, loop over tasks, and even jump around.

🛤️ Categories of Control Flow in Dart

Control flow statements in Dart can be divided into three categories:

- Decision-Making Statements (Make choices based on conditions)
- Looping Statements (Repeat code)
- Jump Statements (Hop around different parts of the code)

🧠 Decision-Making Statements

If Statement

Runs a block of code if a condition is true.

```dart
void main() {
    var age = 10;

    if (age > 18) {
        print("Mariam is a voter in Kenya!");
    }

    print("Mariam is still too young to vote.");
}
```

If-else Statements

Choose between two paths based on a condition.

```dart
void main() {
    var age = 10;

    if (age > 18) {
        print("Mariam is a voter in Kenya!");
    } else {
        print("Mariam is still too young to vote.");
    }
}
```

If else if Statement

Evaluate multiple conditions.

```dart
void main() {
    var age = 10;

    if (age > 18) {
        print("Mariam can vote in Kenya!");
    } else if (age == 18) {
        print("Mariam is just old enough to vote in Kenya!");
    } else {
        print("Mariam is still too young to vote.");
    }
}
```

Switch Case Statement

Evaluate an expression and execute different blocks of code based on matching cases.

```dart
void main() {
    int day = 3;

    switch (day) {
        case 1:
            print("Monday: Let's code!");
            break;
        case 2:
            print("Tuesday: Keep coding!");
            break;
        case 3:
            print("Wednesday: Halfway through!");
            break;
        default:
            print("Time for the weekend!");
    }
}
```

🔄 Looping Statements

For loop

Used when you know how many times a block of code will execute.

```dart
void main() {
    for (int i = 1; i <= 5; i++) {
        print("This is loop iteration $i");
    }
}
```

For…in loop

Iterates through an object's properties.

```dart
void main() {
    var list1 = [10, 20, 30, 40, 50];
    for (var i in list1) {
        print(i);
    }
}
```

While loop

Executes as long as the condition is true.

```dart
void main() {
    var list1 = [10, 20, 30, 40, 50];
    int i = 0;

    while (i < list1.length) {
        print(list1[i]);
        i++;
    }
}
```

Do-while loop

Executes a block of code first and then checks the condition.

```dart
void main() {
    var a = 1;
    var maxnum = 10;
    do {
        print("The value is: ${a}");
        a = a + 1;
    } while (a < maxnum);
}
```

Jump Statements

Break

Stops the closest enclosing loop or switch statement.

```dart
void main() {
    for (int i = 0; i < 5; i++) {
        if (i == 3) {
            break;
        }
        print(i);
    }
}
```

Continue

Skips the current iteration of the loop and proceeds to the next iteration.

```dart
void main() {
    for (int i = 0; i < 5; i++) {
        if (i == 2) {
            continue;
        }
        print(i);
    }
}
```

Return

Exits from a function, optionally returning a value.

```dart
int sum(int a, int b) {
    return a + b;
}

void main() {
    print(sum(3, 4));
}
```

Assert

Used in development to enforce certain conditions.

```dart
void main() {
    int age = 18;
    assert(age >= 18, "Age must be at least 18");
    print("You are $age years old.");
}
```

Watch this video to learn more about decision-making in Dart.

[![alt text](./images/image1.png)](https://youtu.be/XwYmGLknk3w)

Watch this video to learn more about looping statements in Dart (Do-While, For-Loop, While).

[![alt text](./images/image1.png)](https://youtu.be/pUzqcudxt44)

# GitHub Resources

- [DART-SAF-HOOK](https://github.com/Lenkaa3792/DART-SAF-HOOK)
- [Dart-main-concepts](https://github.com/Lenkaa3792/Dart-main-concepts)

## Lesson 1

[Zoom Recording](https://powerlearnproject-org.zoom.us/rec/share/w6kmXWkSRkvN2nHRwRs12ZQxrLSw1MnfXc88nVKwrbW_A7scF-dKB2NkQM5Ul5JX.Nctk0VwqafOhI6DZ)
