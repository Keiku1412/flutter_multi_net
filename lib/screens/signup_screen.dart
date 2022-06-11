import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/models/user.dart';
import 'package:flutter_login_ui/screens/Operator_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_login_ui/utilities/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordContorller = TextEditingController();
  TextEditingController _userNumberController = TextEditingController();

  /* Future<User> usersignUp(String useremail, String password, num number) async {
    const url = "http://10.0.2.2:3000/register";
    Map<String, dynamic> requestPayload = {
      "email": useremail,
      "password": password,
      "number": number,
    };
    final http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestPayload));
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("fail to sign up user");
    }
  }*/

// Define a key to access the form
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';
  String _confirmPassword = '';
  num _userNumber = 0;
  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm(BuildContext context) {
    final isValid = _formKey.currentState.validate();
    //validtion message to console
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_password);
      print(_confirmPassword);
      print(_userNumber);

      //router to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ope()),
      );
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _userEmailController,
            //validation
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Please enter your email address';
              }
              // Check if the entered email has the right format
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              // Return null if the entered email is valid
              return null;
            },
            onChanged: (value) => _userEmail = value,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            //validation
            validator: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters in length';
              }
              // Return null if the entered password is valid
              return null;
            },
            onChanged: (value) => _password = value,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordVerify() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Verify your password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _confirmPasswordContorller,
            //validation
            validator: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              }

              if (value != _password) {
                return 'Confimation password does not match the entered password';
              }

              return null;
            },
            onChanged: (value) => _confirmPassword = value,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'ReEnter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: 400,
          height: 60.0,
          child: IntlPhoneField(
            controller: _userNumberController,
            //validation
            autoValidate: false,
            maxLength: 8,
            validator: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              }

              if (value.length != 8) {
                return 'Number is not correct';
              }

              return null;
            },
            onChanged: (value) => _userNumber = value as num,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 1.0),
              hintText: 'Phone Number',
              hintStyle: kHintTextStyle,
            ),
            countryCodeTextColor: Colors.white,
            dropDownArrowColor: Colors.white,
            initialCountryCode: 'TN',
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade500,
        title: Text('Create New account'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade500,
                      Colors.blue.shade600,
                      Colors.blue.shade700,
                      Colors.blue.shade800,
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              'Sign Up with ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'assets/images/1.png',
                              width: 80,
                              height: 80,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordVerify(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPhoneNumberTF(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () {
                              _trySubmitForm(context);
                              setState(() {
                                /*usersignUp(
                                  _userEmailController.text,
                                  _passwordController.text,
                                  _userNumberController.hashCode,
                                );*/
                              });
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
