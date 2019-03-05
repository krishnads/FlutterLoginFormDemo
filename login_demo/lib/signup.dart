import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {

  @override 
  State<StatefulWidget> createState() => new _SignUpPageState();
  
}
 
class _SignUpPageState extends State<SignUpPage> {

  final formKey = new GlobalKey<FormState>();
  String email;
  String name;
  String password;

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Full Name'),
                validator: (value) => value.isEmpty ? "Name can't be blank" :null,
                onSaved: (value) => name =value,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email Address'),
                validator: (value) => value.isEmpty ? "Email Address can't be blank" :null,
                onSaved: (value) => email =value,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Password'),
                validator: (value) => value.isEmpty ? "Password can't be blank" :null,
                onSaved: (value) => password =value,
              ),
              new RaisedButton(
                child: new Text('SignUp', style:new TextStyle(fontSize: 20)),
                onPressed: validateForm,
              ),
              FlatButton(
                child: new Text('Login here', style:new TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context, '/login');
                },
              ),
            ],
          )
        )
      )
    );
  }

  void validateForm() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      print('validated');
      Navigator.pushNamed(context, '/home');
    } else {
      print('invalid');
    }
  }
}

