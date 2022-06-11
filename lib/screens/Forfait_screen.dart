import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Forfait extends StatefulWidget {
  @override
  _ForfaitState createState() => _ForfaitState();
}

class _ForfaitState extends State<Forfait> {
  bool _f1 = false;

  bool _f2 = false;

  bool _f3 = false;

  bool _f4 = false;

  Widget _buildForfaitInfoCard() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 220,
      width: 300,
      child: Card(
        color: Colors.blue.shade900,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, right: 10, bottom: 10),
                  child: Container(
                      child: Text(
                    '''Profitez du prix minute et des forfaits Internet les moins chers et composez vos options selon vos besoins et à des prix reduits !
                          ''',
                    maxLines: 20,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
                )
              ],
            ),
          ]),
        ),
        elevation: 30,
      ),
    );
  }

  Widget _buildforfait1() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 250,
      width: 90,
      child: Card(
        color: _f1 == false ? Colors.blue[900] : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '100 MO',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '10 MIN',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '=',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '0.5DT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Checkbox(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                value: _f1,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _f1 = value;
                    _f2 = false;
                    _f3 = false;
                    _f4 = false;
                  });
                },
              ),
            ),
          ],
        ),
        elevation: 20,
      ),
    );
  }

  Widget _buildforfait2() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 250,
      width: 90,
      child: Card(
        color: _f2 == false ? Colors.blue[900] : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '400 MO',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '20 MIN',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '=',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '1.0DT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Checkbox(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                value: _f2,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _f2 = value;
                    _f1 = false;
                    _f3 = false;
                    _f4 = false;
                  });
                },
              ),
            ),
          ],
        ),
        elevation: 20,
      ),
    );
  }

  Widget _buildforfait3() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 250,
      width: 90,
      child: Card(
        color: _f3 == false ? Colors.blue[900] : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '1 GO',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '30 MIN',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '=',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '2.0DT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Checkbox(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                value: _f3,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _f3 = value;
                    _f1 = false;
                    _f2 = false;
                    _f4 = false;
                  });
                },
              ),
            ),
          ],
        ),
        elevation: 20,
      ),
    );
  }

  Widget _buildforfait4() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 250,
      width: 90,
      child: Card(
        color: _f4 == false ? Colors.blue[900] : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '4 GO',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '60 MIN',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
              child: Text(
                '=',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                '5.0DT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Checkbox(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                value: _f4,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _f4 = value;
                    _f1 = false;
                    _f2 = false;
                    _f3 = false;
                  });
                },
              ),
            ),
          ],
        ),
        elevation: 20,
      ),
    );
  }

  Widget _buildRegister() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _f1 == true || _f2 == true || _f3 == true || _f4 == true
            ? () {
                print("forfait has been choosed");
              }
            : null,
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.blue.shade800,
            letterSpacing: 1.5,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade500,
        title: Text('Forfaits List'),
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
                    horizontal: 10.0,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forfaits',
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildforfait1(),
                            _buildforfait2(),
                            _buildforfait3(),
                            _buildforfait4(),
                          ],
                        ),
                      ),
                      _buildForfaitInfoCard(),
                      _buildRegister(),
                    ],
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
