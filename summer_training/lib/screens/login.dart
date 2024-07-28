import 'package:flutter/material.dart';
import 'package:summer_training/screens/signup.dart';
import 'package:summer_training/screens/welcome.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Color(0xAA333EFF),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xBAFFFFFF),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(200, 250),
                      bottomLeft: Radius.elliptical(170, 300))),
              width: width,
              height: height,
            ),
          ),
          Positioned(
            bottom: 20,
            top: 20,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(200, 300),
                      bottomLeft: Radius.elliptical(200, 300))),
              width: width,
              height: height,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0x55AAAAAA), shape: BoxShape.circle),
                    width: width / 3,
                    height: height / 3,
                    child: Image.asset("assests/imgs/cxLogo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0x11A6A6FF),
                              // focusColor:Color(0xA6A6A6FF) ,

                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xAA333EFF),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please Enter you email';
                              }
                            },
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0x11A6A6FF),
                              // focusColor:Color(0xA6A6A6FF) ,

                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () => null,
                              ),
                              suffixIconColor: Color(0xAA333EFF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xAA333EFF),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please Enter you password';
                              }
                            },
                          ),
                          SizedBox(
                            height: height / 15,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xAA333EFF),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(width / 1.2, height / 15))),
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()),
                                (route) => false),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  letterSpacing: 5),
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen())),
                              child: Text(
                                "Dont't have an account?",
                                style: TextStyle(
                                  color: Color(0xAA333EFF),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
