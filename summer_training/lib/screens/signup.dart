import 'package:flutter/material.dart';
import 'package:summer_training/screens/login.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
        body: Stack(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0x55AAAAAA), shape: BoxShape.circle),
                        width: width / 4,
                        height: height / 4,
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

                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
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
                                    return 'please Enter you name';
                                  }
                                },
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0x11A6A6FF),
                                  // focusColor:Color(0xA6A6A6FF) ,

                                  hintText: "Phone",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
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
                                    return 'please Enter you phone';
                                  }
                                },
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0x11A6A6FF),
                                  // focusColor:Color(0xA6A6A6FF) ,

                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
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
                                height: height / 40,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () => null ,),
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
                                height: height / 40,
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
                                    minimumSize: MaterialStateProperty.all<
                                        Size>(
                                        Size(width / 1.2, height / 14))),
                                onPressed: () => null,
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                      letterSpacing: 5),
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen())),
                                  child: Text(
                                    "Already have account",
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
            ),
          ],
        ));
  }
}
