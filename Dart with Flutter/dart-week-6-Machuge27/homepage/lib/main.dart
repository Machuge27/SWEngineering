
import 'package:flutter/material.dart'; 
import 'package:device_preview_plus/device_preview_plus.dart';

// The main function serves as the entry point for the Flutter application.
void main() {
  runApp(
    DevicePreview(
      enabled: true, // Enable device preview to test responsiveness across devices.
      tools: [
        ...DevicePreview.defaultTools, // Load the default tools provided by the package.
      ],
      builder: (context) => MyApp(), // Define the root widget of the app.
    ),
  );
}

// The main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner.
      title: 'Flutter UI Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(), // Sets the home screen of the app.
    );
  }
}

// Home screen widget which is stateful (can change over time)
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// State class of the HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Controller for username input
  final TextEditingController _passwordController = TextEditingController(); // Controller for password input
  bool _isPasswordVisible = false; // Flag to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Homepage',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Allows scrolling when the content overflows
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              // Welcome message inside a styled container
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Text(
                      'Welcome to My App!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please login to continue',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Displaying an image from the internet
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?auto=format&fit=crop&w=1374&q=80',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Text('Could not load image'),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 30),
              
              // A button that triggers a snack bar when clicked
              ElevatedButton(
                onPressed: () {
                  print('Button Clicked!');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button was clicked!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Click Me!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Login form heading
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              
              // Username TextField
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username!',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                ),
              ),
              
              const SizedBox(height: 15),
              
              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: _isPasswordVisible, // Hide text for password security
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password!S',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),

                  suffixIconConstraints: const BoxConstraints(minWidth: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                ),
              ),
              
              const SizedBox(height: 25),
              
              // Row containing Login and Register buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Login button pressed');
                        print('Username: ${_usernameController.text}');
                        print('Password: ${_passwordController.text}');
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login attempted')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Register button pressed');
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registration requested')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _usernameController.dispose(); // Dispose of the controllers when not in use
    _passwordController.dispose();
    super.dispose();
  }
}




