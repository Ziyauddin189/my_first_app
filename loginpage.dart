import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _mobileNumberController = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _mobileNumberController.addListener(_validateInput);
    check_if_already_login();
  }


  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
   
  }

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  void _validateInput() {
    final enteredValue = _mobileNumberController.text.trim();
    final isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(enteredValue);
    final isValidNumber = RegExp(r'^\d{10}$').hasMatch(enteredValue);
    if (!isValidEmail && !isValidNumber) {
      setState(() {
        _errorMessage = 'Please enter a valid email or 10-digit number';
      });
    } else {
      setState(() {
        _errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Child 1: Image Widget
            Image.asset(
              'images/wallpaper.jpg',
              width: 500, // specify the width
              height: 200, // specify the height
              fit: BoxFit.cover, // adjust the aspect ratio of the image
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Child 1: Image Widget
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Child 2: Image Widget
                        Image.asset('images/logo.jpg', height: 70),
                        // Child 3: Text Widget - 'Welcome'
                        Center(
                          child: Text(
                            'Welcome back channel partner!',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800], // set a dark grey color
                            ),
                            textAlign: TextAlign.center, // center the text
                          ),
                        ),

                        // Child 4: Text Widget - 'Login'

                        // Child 4: Text Widget - 'Login'
                        SizedBox(height:0,width:100),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 0, width: 100),
                        // Child 5: Text Widget - 'Mobile number or email'
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Mobile number or email*',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        // Child 6: 10 digit number or email input
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: TextField(
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter mobile number or email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        // Show error message if there is one
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        // Child 7: Clipped Container with Text - 'Continue'
                        SizedBox(height: 10, width: 100),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90.0),
                          child:
                          ElevatedButton(
                            onPressed: _errorMessage.isEmpty
                                ? () {
                              String username = _mobileNumberController.text;

                              if (username != '' ) {
                                print('Successful');
                                logindata.setBool('login', false);
                                logindata.setString('username', username);

                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                                );
                              }

                             
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              minimumSize: Size(double.infinity, 45),
                              // Set the height of the button to 50
                            ),
                            child: Text('Continue'),
                          ),

                        ),
                        // Child 8: Text Widget - 'Or continue with'
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
                                  minimumSize: Size(115.0, 39.0), // set minimum size for button
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
                                  minimumSize: Size(110.0, 39.0), // set minimum size for button
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
                                  minimumSize: Size(115.0, 39.0), // set minimum size for button
                                ),
                                child: Image.asset('images/apple.png', width: 18.0),
                              ),
                            ),

                          ],
                        ),


                        // Child 10: Text Widget with icon - 'Continue with fingerprint'
                        SizedBox(height:3),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              side: BorderSide(color: Colors.grey[300] ?? Colors.grey), // change border color to light grey
                              padding: EdgeInsets.zero,
                              minimumSize: Size(115.0, 39.0), // set minimum size for button
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fingerprint, color: Colors.black),
                                SizedBox(width: 8.0),
                                Text('Continue with fingerprint', style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        ),


                        // Child 11: Text Widget - 'Don't have an account? Register'


                        SizedBox(height:20,width:100),

                        Center(
                          child: InkWell(
                            onTap: () {
                              // Open registration screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterPage()),
                              );

                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Register",
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
                        // Child 11: Text Widget - 'Don't have an account?
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


