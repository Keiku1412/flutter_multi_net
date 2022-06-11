import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/screens/Forfait_screen.dart';

class Ope extends StatefulWidget {
  @override
  _OpeState createState() => _OpeState();
}

class _OpeState extends State<Ope> {
  bool _tele = false;
  bool _oore = false;
  bool _oran = false;
  //three dots handleclick
  void handleClick(String value) {}
  //4G,3G..Menu
  Widget _buildDropDown() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton<ListItem>(
          dropdownColor: Colors.blue[900],
          iconEnabledColor: Colors.blue[100],
          focusColor: Colors.blue[100],
          iconDisabledColor: Colors.blue[100],
          value: _selectedItem,
          items: _dropdownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          }),
    );
  }

//DropdownMenuItems
  List<ListItem> _dropdownItems = [
    ListItem(1, "4G Technologie"),
    ListItem(2, "3G Technologie"),
    ListItem(3, "2G Technologie"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget _buildTelecomOpera() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: 390,
      child: Card(
        elevation: 30,
        color: _tele == false ? Colors.blue[900] : Colors.green,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 5,
                right: 15,
              ),
              child: Container(
                height: 180,
                child: Column(
                  children: [
                    Row(
                      children: [
                        //Operator name
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Operateur : TNNTEL ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        //checkbox
                        Container(
                          child: Checkbox(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            value: _tele,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _tele = value;
                                _oore = false;
                                _oran = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        //three dots menu
                        PopupMenuButton<String>(
                          color: Colors.blue[100],
                          onSelected: handleClick,
                          itemBuilder: (BuildContext context) {
                            return {'MccMnc : 60501', 'Reaseau vocal: LTE'}
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Picture and icon background
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          )),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/2.png',
                            height: 70,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            child: Icon(
                              Icons.signal_cellular_alt_outlined,
                              color: Colors.green,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOoredooOpera() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: 390,
      child: Card(
        elevation: 30,
        color: _oore == false ? Colors.blue[900] : Colors.green,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 5,
                right: 15,
              ),
              child: Container(
                height: 180,
                child: Column(
                  children: [
                    Row(
                      children: [
                        //Operator name
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Operateur : OOREDOO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        //checkbox
                        Container(
                          child: Checkbox(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            value: _oore,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _oore = value;
                                _tele = false;
                                _oran = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        //three dots menu
                        PopupMenuButton<String>(
                          color: Colors.blue[100],
                          onSelected: handleClick,
                          itemBuilder: (BuildContext context) {
                            return {'MccMnc : 60501', 'Reaseau vocal: LTE'}
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Picture and icon background
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/3.png',
                            width: 60,
                            height: 70,
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            child: Icon(
                              Icons.signal_cellular_alt_outlined,
                              color: Colors.orange[700],
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrangeOpera() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: 390,
      child: Card(
        elevation: 30,
        color: _oran == false ? Colors.blue[900] : Colors.green,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 5,
                right: 15,
              ),
              child: Container(
                height: 180,
                child: Column(
                  children: [
                    Row(
                      children: [
                        //Operator name
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Operateur : ORANGE  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        //checkbox
                        Container(
                          child: Checkbox(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            value: _oran,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _oran = value;
                                _tele = false;
                                _oore = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        //three dots menu
                        PopupMenuButton<String>(
                          color: Colors.blue[100],
                          onSelected: handleClick,
                          itemBuilder: (BuildContext context) {
                            return {'MccMnc : 60501', 'Reaseau vocal: LTE'}
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Picture and icon background
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/4.png',
                            width: 60,
                            height: 70,
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            child: Icon(
                              Icons.signal_cellular_alt_outlined,
                              color: Colors.red,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegister() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _oran == true || _oore == true || _tele == true
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forfait()),
                );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade500,
        title: Text('Operators List'),
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
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Operators ',
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
                      _buildDropDown(),
                      _buildTelecomOpera(),
                      _buildOoredooOpera(),
                      _buildOrangeOpera(),
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

//item class
class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
