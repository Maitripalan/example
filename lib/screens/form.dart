import 'package:example/screens/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _name = TextEditingController(text: '');
  TextEditingController _email = TextEditingController(text: '');

  TextEditingController _mobile = TextEditingController(text: '');
  TextEditingController _company = TextEditingController(text: '');
  TextEditingController _city = TextEditingController(text: '');

  Future<void> _setData(String name, String email, String mobile,
      String company, String course, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("email", email);

    await prefs.setString("mobile", mobile);

    await prefs.setString("company", company);
    await prefs.setString("course", course);
    await prefs.setString("city", city);
  }

  String _radioVal = 'MSC(CA & IT)';

  bool verifyEmail(String email) {
    bool check = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return check;
  }

  int? _radioValue = 0;

  VoidCallback? _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          setState(() {
            _radioVal = "MSC(CA & IT)";
          });
          break;

        case 1:
          setState(() {
            _radioVal = "MSC IT";
          });
          break;

        case 2:
          setState(() {
            _radioVal = "BE / BSC IT";
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(238, 232, 241, 0.9),
        appBar: AppBar(
          backgroundColor: Colors.purple.shade800,
          title: Center(child: Text("Registration Form")),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.purple.shade800,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Workshop on Mobile Application Development Using Flutter",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 35),
                        ),
                        Text(
                          "- Participant should have their own laptop havibg Android Studio Installed in it.",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                            "- Institute will provide the computer set up to the remaining participant without laptop.",
                            style: TextStyle(fontSize: 20)),
                        Text(
                            "- It is desirable that participants are having a knowledge of Android and basic programing Skills.",
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("* Required",
                            style: TextStyle(color: Colors.red, fontSize: 20)),
                        SizedBox(height: 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Name"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _name,
                                autofocus: false,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(hintText: "Your answer"),
                              )
                            ]))),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("E-mail Id"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _email,
                                autofocus: false,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(hintText: "Your answer"),
                              )
                            ]))),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Mobile Number"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _mobile,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                autofocus: false,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(hintText: "Your answer"),
                              )
                            ]))),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Name of the Institute/Company"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _company,
                                autofocus: false,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(hintText: "Your answer"),
                              )
                            ]))),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Course"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.purple.shade800,
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text('MSC(CA & IT)'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.purple.shade800,
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text('MSC IT'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.purple.shade800,
                                    value: 3,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text('BE / BSC IT'),
                                ],
                              )
                            ]))),
                SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        offset: new Offset(0.0, 0.0),
                        // blurRadius: 5.0,
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("City"),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _city,
                                autofocus: false,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(hintText: "Your answer"),
                              )
                            ]))),
                SizedBox(height: 20),
                ElevatedButton(
                    // style: ButtonStyle(backgroundColor: MaterialStateProperty(Colors.accents)),
                    onPressed: () async {
                      try {
                        if (_name.text.trim().length < 0 ||
                            _name.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 5000),
                              content: Text("Please Enter Valid Name !"),
                            ),
                          );
                        } else if (_email.text.trim().length < 0 ||
                            _email.text.isEmpty ||
                            (!verifyEmail(_email.text))) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 5000),
                              content: Text("Please Enter valid Email !"),
                            ),
                          );
                        } else if (_mobile.text.trim().length < 0 ||
                            _mobile.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 5000),
                              content:
                                  Text("Please enter 10 digit mobile Number !"),
                            ),
                          );
                          ;
                        } else if (_company.text.trim().length < 0 ||
                            _company.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 5000),
                              content: Text(
                                  "Please enter valid Company/Insitute Name !"),
                            ),
                          );
                        } else if (_city.text.trim().length < 0 ||
                            _city.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 5000),
                              content: Text("Please enter valid city !"),
                            ),
                          );
                          ;
                        } else {
                          await _setData(_name.text, _email.text, _mobile.text,
                              _company.text, _radioVal, _city.text);

                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResponsePage()));
                        }
                      } catch (err) {
                        print("Error Rgistration Form - ");
                        print(err.toString());
                      }
                    },
                    child: Text("Submit")),
                SizedBox(height: 10),
                Text(
                  "Never Submit passwords through Google Forms.",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                    child: Text(
                  "This form was Created for Demo.",
                  style: TextStyle(fontSize: 15),
                )),
                SizedBox(
                  height: 18,
                ),
                Center(
                    child: Text(
                  "Google Forms",
                  style: TextStyle(
                      fontSize: 25, color: Colors.grey, letterSpacing: 2),
                )),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
