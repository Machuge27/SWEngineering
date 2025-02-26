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

    // 🔮 Crafting string code
    String coderName = "Ada Lovelace";
    String favoriteLanguage = "Dart";
    String favoriteEmoji = "💻";

    // 🧙‍♀️ Combine strings using string interpolation (the power of `${}`!)
    print("👩‍💻 Hello, my name is $coderName, and I code in $favoriteLanguage $favoriteEmoji");

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

    // use square brackets for listing
    List myList = [1, 2, 4, "Jackson"];
    // adding value to the list

    myList.add(67);
    myList.remove("Jackson");
    // remove value
    // myList.remove(4);
    print(myList);
    

    // Creating a Map with String keys and int values
    Map<String, int> ages = {
        'Alice': 30,
        'Bob': 25,
        'Charlie': 35,
    };
    print("Ages of students: $ages");

    // 🧙‍♀️ Summon emojis and symbols using runes
    Runes magicRunes = Runes('\u2764\u1F60A\u1F680');  // ❤️😊🚀

    // 🔮 Decoding the rune spell into a readable string
    String castedMagic = String.fromCharCodes(magicRunes);
    
    // 🔮 Output the magic!
    print("✨ Casting runes: $castedMagic");
}