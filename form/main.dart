import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blueGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(245, 104, 97, 223), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 151, 33, 20), width: 2.0),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.brown),
    ),
    home: MyForm(),
  ));
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  var _myFormKey = GlobalKey<FormState>();
  var _password = TextEditingController();
  var _dateofbirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Form"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Form(
            key: _myFormKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String) {
                      if (String!.isEmpty) {
                        return " please enter name";
                      }
                      if (String.length < 4) {
                        return "Name is less 4 character";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: ("Name"),
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String) {
                      if (String!.isEmpty) {
                        return " please enter your Email";
                      }
                      if (String.length < 12) {
                        return "please Enter valid Email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: ("Email"),
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _password,
                    // this will not show the password
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: ("Password"),
                        hintText: "Enter your Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _dateofbirth,
                    // Add  validation  here
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                        labelText: ("Date of birth"),
                        hintText: "Enter your Date of birth",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: ("Gender"),
                        hintText: "Enter your Gender",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                // ... (rest of your form fields)
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (_myFormKey.currentState!.validate()) {
                      // Navigate to SuccessPage when the form is valid
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessPage()),
                      );
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submission Successful")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,
                size: 100, color: Color.fromARGB(255, 40, 86, 42)),
            SizedBox(height: 20),
            Text(
              " Submitted Form Successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the form
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
