import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
  var _confirmpassword = TextEditingController();
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
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Form has been submitted successfully!",
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
