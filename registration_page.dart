import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isChecked = false;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _phoneRegExp = RegExp(r'^\d{10}$');

  String? _emailErrorText;
  String? _phoneErrorText;
  String? _checkboxErrorText;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      _emailErrorText = null;
    });
    final email = _emailController.text.trim();
    if (!_emailRegExp.hasMatch(email)) {
      setState(() {
        _emailErrorText = 'Invalid email address';
      });
    }
  }

  void _validatePhone() {
    setState(() {
      _phoneErrorText = null;
    });
    final phone = _phoneController.text.trim();
    if (!_phoneRegExp.hasMatch(phone)) {
      setState(() {
        _phoneErrorText = 'Invalid phone number';
      });
    }
  }

  void _validateCheckbox() {
    setState(() {
      _checkboxErrorText = null;
    });
    if (!_isChecked) {
      setState(() {
        _checkboxErrorText = 'Please agree to the terms and privacy policy';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Child 1: Image Widget
              // Child 1: Image Widget

              // Child 2: Image Widget
              Image.asset('images/logo.jpg', height: 50),
              // Child 3: Text Widget - 'Welcome'

              // Child 4: Text Widget - 'Login'
              SizedBox(height: 0),
              SizedBox(height: 30, width: 100),
              Text(
                'Register Now',
                style:
                TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 30),
              Text(
                'Email*',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  errorText: _emailErrorText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (_) => _validateEmail(),
              ),
              SizedBox(height: 10),
              Text(
                'Mobile number*',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter mobile number',
                  errorText: _phoneErrorText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (_) => _validatePhone(),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.redAccent,
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'By continuing, I agree with the ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to terms of use page
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to privacy policy page
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                _checkboxErrorText ?? '',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate email input
                    if (_emailController.text.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_emailController.text)) {
                      setState(() {
                        _emailErrorText = 'Invalid email address';
                      });
                    } else {
                      setState(() {
                        _emailErrorText = null;
                      });
                    }

                    // Validate phone input
                    if (_phoneController.text.isEmpty ||
                        !RegExp(r'^\d{10}$').hasMatch(_phoneController.text)) {
                      setState(() {
                        _phoneErrorText = 'Invalid phone number';
                      });
                    } else {
                      setState(() {
                        _phoneErrorText = null;
                      });
                    }

                    // Check if the checkbox is checked
                    if (!_isChecked) {
                      setState(() {
                        _checkboxErrorText = 'Please accept the Terms of Use and Privacy Policy';
                      });
                    } else {
                      setState(() {
                        _checkboxErrorText = null;
                      });
                    }

                    // If all inputs are valid, navigate to login page
                    if (_emailErrorText == null && _phoneErrorText == null && _checkboxErrorText == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },




                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text('Continue'),
                ),
              ),


              // Child 8: Text Widget - 'Or continue with'
              SizedBox(height:10,width:100),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Text(
                    '- - - - - - - - - - - - - -  Or continue with  - - -  - - - - - - - - - - - ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[400], // set a lighter color
                    ),
                    textAlign: TextAlign.center, // center the text
                  ),
                ),
              ),


              // Child 9: 3 icons (Google, Facebook, Apple)
              SizedBox(height:10,width:100),

              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(color: Colors.grey[300] ?? Colors.grey),
                        padding: EdgeInsets.zero,
                        minimumSize: Size(120.0, 39.0), // set minimum size for button
                      ),
                      child: Image.asset('images/google.png', width: 18.0),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(color: Colors.grey[300] ?? Colors.grey),
                        padding: EdgeInsets.zero,
                        minimumSize: Size(120.0, 39.0), // set minimum size for button
                      ),
                      child: Image.asset('images/facebook.png', width: 18.0),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(color: Colors.grey[300] ?? Colors.grey),
                        padding: EdgeInsets.zero,
                        minimumSize: Size(120.0, 39.0), // set minimum size for button
                      ),
                      child: Image.asset('images/apple.png', width: 18.0),
                    ),
                  ),

                ],
              ),

              // Child 11: Text Widget - 'Don't have an account? Register'

              SizedBox(height:20,width:100),

              Center(
                child: InkWell(
                  onTap: () {
                    // Open log in screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Alredy have an account? ",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            fontSize: 16.0,
                            decoration: TextDecoration.underline,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
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







