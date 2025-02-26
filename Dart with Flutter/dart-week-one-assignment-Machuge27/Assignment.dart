void main() {
  // Define Variables
  int myInt = 10;
  double myDouble = 20.5;
  String myString = "Hello, Dart!";
  bool myBool = true;
  List<int> myList = [1, 2, 3, 4, 5];

  // Type Conversion Functions
  int stringToInt(String str) => int.parse(str);
  double stringToDouble(String str) => double.parse(str);
  String intToString(int num) => num.toString();
  double intToDouble(int num) => num.toDouble();

  // Function for Conversion
  void convertAndDisplay(String str) {
    int intValue = stringToInt(str);
    double doubleValue = stringToDouble(str);
    print('String to int: $intValue');
    print('String to double: $doubleValue');
  }

  // Control Flow - If-Else Statements
  void checkNumber(int num) {
    if (num > 0) {
      print('$num is positive');
    } else if (num < 0) {
      print('$num is negative');
    } else {
      print('$num is zero');
    }
  }

  void checkVotingEligibility(int age) {
    if (age >= 18) {
      print('Eligible to vote');
    } else {
      print('Not eligible to vote');
    }
  }

  // Control Flow - Switch Case
  void printDayOfWeek(int day) {
    switch (day) {
      case 1:
        print('Monday');
        break;
      case 2:
        print('Tuesday');
        break;
      case 3:
        print('Wednesday');
        break;
      case 4:
        print('Thursday');
        break;
      case 5:
        print('Friday');
        break;
      case 6:
        print('Saturday');
        break;
      case 7:
        print('Sunday');
        break;
      default:
        print('Invalid day');
    }
  }

  // Control Flow - Loops
  void printNumbersForLoop() {
    print("First 10 digits:");
    for (int i = 1; i <= 10; i++) {
      print(i);
    }
  }

  void printNumbersWhileLoop() {
    int i = 10;
    print("First 10 digits from 10:");
    while (i >= 1) {
      print(i);
      i--;
    }
  }

  void printNumbersDoWhileLoop() {
    int i = 1;
    print("First 5 digits using do-while loop:");
    do {
      print(i);
      i++;
    } while (i <= 5);
  }

  // Combining Data Types and Control Flow - Complex Example
  void processList(List<int> numbers) {
  for (int number in numbers) {
    print('Number: $number');
    print(number % 2 == 0 ? '$number is even' : '$number is odd');

    switch (number) {
      case <= 10:
        print('$number is small');
        break;
      case <= 100:
        print('$number is medium');
        break;
      default:
        print('$number is large');
    }
  }
}
  // Test the functions
  convertAndDisplay("123");
  checkNumber(-5);
  checkVotingEligibility(20);
  printDayOfWeek(3);
  printNumbersForLoop();
  printNumbersWhileLoop();
  printNumbersDoWhileLoop();
  processList([1, 15, 101, 7, 50]);
}