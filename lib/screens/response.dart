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
                          Center(
                            child: Text(
                              "Response Review ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 7),
                          Center(
                            child: Table(
                                defaultColumnWidth: FixedColumnWidth(120.0),
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                children: [
                                  TableRow(children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Fields',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.purple.shade800,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Response',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.purple.shade800,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Name'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(name),
                                    )),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Email'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(email),
                                    )),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Phone number'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(mobile),
                                    )),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Course'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(course),
                                    )),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('City'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(city),
                                    )),
                                  ]),
                                  TableRow(children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Insitute/Company'),
                                    )),
                                    Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(company),
                                    )),
                                  ]),
                                ]),
                          ),
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
