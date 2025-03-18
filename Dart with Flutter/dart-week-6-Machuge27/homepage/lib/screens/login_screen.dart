import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoginForm = true;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleFormMode() {
    setState(() {
      _isLoginForm = !_isLoginForm;
      _usernameController.clear();
      _passwordController.clear();
      _emailController.clear();
    });
  }

  Future<void> _submitForm() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    if (_isLoginForm) {
      if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
        _showErrorMessage('Please enter username and password');
        return;
      }
      
      final success = await authProvider.login(
        _usernameController.text,
        _passwordController.text,
      );
      
      if (success && mounted) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (mounted) {
        _showErrorMessage('Login failed: Invalid credentials');
      }
    } else {
      if (_usernameController.text.isEmpty || 
          _passwordController.text.isEmpty ||
          _emailController.text.isEmpty) {
        _showErrorMessage('Please fill all fields');
        return;
      }
      
      final success = await authProvider.register(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      );
      
      if (success && mounted) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (mounted) {
        _showErrorMessage('Registration failed: Username may be taken');
      }
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginForm ? 'Login' : 'Register'),
        centerTitle: true,
      ),
      body: authProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    
                    // App Logo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/key.jpg',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Title
                    Text(
                      _isLoginForm ? 'Welcome Back!' : 'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    Text(
                      _isLoginForm 
                          ? 'Please sign in to continue' 
                          : 'Fill the form to register',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Username field
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Email field (Only for registration)
                    if (!_isLoginForm) ...[
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter your email address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // Password field
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword 
                                ? Icons.visibility_off 
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _submitForm(),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Login/Register button
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        _isLoginForm ? 'LOGIN' : 'REGISTER',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Toggle between login and registration
                    TextButton(
                      onPressed: _toggleFormMode,
                      child: Text(
                        _isLoginForm
                            ? 'Don\'t have an account? Register'
                            : 'Already have an account? Login',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}