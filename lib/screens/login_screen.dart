import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/api/api_service.dart';
import 'package:flutter_login_ui/loading.dart';
import 'package:flutter_login_ui/model_login/login_model.dart';
import 'package:flutter_login_ui/screens/signup_screen.dart';
import 'package:flutter_login_ui/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isApiCallProcess = false;

  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool _rememberMe = false;
  // Define a key to access the form

  LoginRequestModel requestModel;
  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  Widget build(BuildContext context) {
    return ProgressHUD(
      child: buildui(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      color: Colors.blue[200],
    );
  }

  String _userEmail = '';
  String _password = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm(BuildContext context) {
    final isValid = globalFormKey.currentState.validate();
    //validtion message to console
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_password);

      //router to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signup()),
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
            onSaved: (input) => requestModel.email = input,

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
            onSaved: (input) => requestModel.password = input,
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (validateAndSave()) {
            setState(() {
              isApiCallProcess = true;
            });
            APIService apiService = new APIService();
            apiService.login(requestModel).then((value) {
              setState(() {
                isApiCallProcess = false;
              });
              if (value.token.isNotEmpty) {
                final snackBar = SnackBar(content: Text("Login Succesfull"));
                ScaffoldKey.currentState.showSnackBar(snackBar);
              } else {
                final snackBar = SnackBar(content: Text(value.error));
                ScaffoldKey.currentState.showSnackBar(snackBar);
              }
            });

            print(requestModel.toJson());
          }
          print('Login Button Pressed');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginfacebookBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Facebook Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.lightBlue[900],
        child: Text(
          'Facebook',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSignupBtn(BuildContext context) {
    //next page
    return GestureDetector(
      onTap: () {
        _trySubmitForm(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildui(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
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
                    vertical: 70.0,
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              'Welcome to ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 80,
                              child: Image.asset('assets/images/1.png'),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildLoginfacebookBtn(),
                        _buildSignupBtn(context),
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
