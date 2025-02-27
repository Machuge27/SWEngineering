import 'dart:math';

// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.reduce((a, b) => a + b);
  return total + (total * taxRate / 100);
}

// Using an anonymous function to filter out items below a threshold (e.g., $10)
List<double> filterItems(List<double> prices, double threshold) {
  return prices.where((price) => price >= threshold).toList();
}

// Higher-order function to apply a discount function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive function to calculate a factorial discount
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}

void main() {
  // Sample item prices in the cart
  List<double> cartItems = [5.0, 12.0, 20.0, 8.0, 15.0];

  print("Original cart items: \$${cartItems}");

  // Filter out items below $10
  cartItems = filterItems(cartItems, 10.0);
  print("Filtered items (above \$10): \$${cartItems}");

  // Apply a 10% discount using applyDiscount()
  cartItems = applyDiscount(cartItems, (price) => price * 0.90);
  print("Prices after 10% discount: \$${cartItems}");

  // Calculate total price with 5% tax
  double totalPrice = calculateTotal(cartItems, taxRate: 5.0);
  print("Total price after tax: \$${totalPrice.toStringAsFixed(2)}");

  // Apply factorial discount
  int itemCount = cartItems.length;
  int factorialDiscount = calculateFactorialDiscount(itemCount);
  print("Factorial discount for $itemCount items: ${factorialDiscount}%");

  // Apply factorial discount to the final price
  totalPrice -= totalPrice * (factorialDiscount / 100);
  print("Final price after factorial discount: \$${totalPrice.toStringAsFixed(2)}");
}
