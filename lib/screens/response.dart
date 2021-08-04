import 'package:example/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({Key? key}) : super(key: key);

  @override
  _ResponsePageState createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  String name = '';
  String email = '';
  String mobile = '';
  String company = '';
  String course = '';
  String city = '';

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    email = prefs.getString("email")!;
    mobile = prefs.getString("mobile")!;
    company = prefs.getString("company")!;
    course = prefs.getString("course")!;
    city = prefs.getString("city")!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(238, 232, 241, 0.9),
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Center(child: Text("Response")),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
        child: ListView(
          children: <Widget>[
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
                          Text(
                            "Registration Form",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 30),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Response have been Saved.",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 7),
                          Text("Response Review"),
                          SizedBox(height: 7),
                          Table(
                              defaultColumnWidth: FixedColumnWidth(120.0),
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Text('Fields',
                                        style: TextStyle(fontSize: 15.0))
                                  ]),
                                  Column(children: [
                                    Text('Response',
                                        style: TextStyle(fontSize: 15.0))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('Name')]),
                                  Column(children: [Text(name)]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('Email')]),
                                  Column(children: [Text(email)]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('Phone number')]),
                                  Column(children: [Text(mobile)]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('Course')]),
                                  Column(children: [Text(course)]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('City')]),
                                  Column(children: [Text(city)]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('Insitute/Company')]),
                                  Column(children: [Text(company)]),
                                ]),
                              ]),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegistrationForm()));
                            },
                            child: Text(
                              "Submit another response.",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ]))),
          ],
        ),
      ),
    ));
  }
}
