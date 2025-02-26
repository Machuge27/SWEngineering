int sum(int a, int b) {
    return a + b;
}

void main() {

    var age = 10;

    if (age > 18) {
        print("Mariam can vote in Kenya!");
    } else if (age == 18) {
        print("Mariam is just old enough to vote in Kenya!");
    } else {
        print("Mariam is still too young to vote.");
    }

    assert(age >= 18, "Age must be at least 18");
    print("You are $age years old.");

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

    for (int i = 1; i <= 5; i++) {
        print("This is loop iteration $i");
    }

    var list1 = [10, 20, 30, 40, 50];
    for (var i in list1) {
        print(i);
    }

    int i = 0;

    while (i < list1.length) {
        print(list1[i]);
        i++;
    }

    var a = 1;
    var maxnum = 10;
    do {
        print("The value is: ${a}");
        a = a + 1;
    } while (a < maxnum);

    for (int i = 0; i < 5; i++) {
        if (i == 3) {
            break;
        }
        print(i);
    }

    for (int i = 0; i < 5; i++) {
        if (i == 2) {
            continue;
        }
        print(i);
    }

    print(sum(3, 4));
}