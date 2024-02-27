// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import './widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String buttonText = 'Click Me';
  String firstName = '';
   final formKey = GlobalKey<FormState>(); // Key for form
  final textEditingController = TextEditingController();

  void _toggleButtons(bool value) {
    setState(() {
      enabled = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      timesClicked++;
      buttonText = 'Clicked $timesClicked times'; // Update the button text
    });
  }

  void _resetCounter() {
    setState(() {
      timesClicked = 0; // Reset click counter
      buttonText = 'Click Me'; // Reset the button text
    });
  }

  void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.pink[100],

      // Define the default font family.
      fontFamily: 'Georgia',

      // Define the default `ElevatedButton` theme.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink[100], // button background color
        ),
      ),

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: MyFirstPage(),
  ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the label and switch here
              //as children of the row.
               Switch(
                value: enabled,
                onChanged: _toggleButtons,
              ),

               Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'first name',
                      hintText: 'min 1, max 10',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.length < 1 || value.length > 10) {
                        return 'Name must be between 1 and 10 characters';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hey There, Your name is ${textEditingController.text}'),
                            duration: const Duration(seconds: 5),
                            action: SnackBarAction(
                              label: 'Click Me',
                              onPressed: () {
                                print('Hello, ${textEditingController.text}');
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[100], // Adjusted to match the theme color
                    ),
                  ),
                ],
              ),
            ),
               )
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here as children of the row.
              // For each button use a "Visibility Widget" and its child 
              // will be an "ElevatedButton"
                 Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text(buttonText),
                ),
              ),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                ),
              ),
              
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field here as the first
                  // child of the column.
                  // Include as the second child of the column
                  // a submit button that will show a
                  // snackbar with the "firstName" if validation
                  // is satisfied.
                   TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      if (value.length < 1 || value.length > 20) {
                        return 'First name must be between 1 and 20 characters';
                      }
                      return null;
                    },
                   ),
                   ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Hello, ${textEditingController.text}!')),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
