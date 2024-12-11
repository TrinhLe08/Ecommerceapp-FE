import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/confirm-code/page.dart';

class ConfirmMailPage extends StatefulWidget {
  const ConfirmMailPage({super.key});

  @override
  ConfirmMailPageState createState() => ConfirmMailPageState();
}

class ConfirmMailPageState extends State<ConfirmMailPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _checkText = true;

  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _login() {
    String email = _emailController.text;

    if (email.isEmpty || !isValidEmail(email)) {
      setState(() {
        _checkText = false;
      });

      print('Error: $email');
    } else {
      setState(() {
        _checkText = true;
      });
      print('Logging in with Email: $email  ');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmCodePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background/login-register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 0, left: 0, right: 300),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: const Image(
                  image: AssetImage('images/background/avatar.png'),
                  width: 200.0,
                ),
              ),
              const Text(
                'CONFIRM MAIL',
                style: TextStyle(
                  fontFamily: "Serif",
                  color: Color.fromARGB(255, 195, 147, 147),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email :',
                    hintText: 'Enter your email ',
                  ),
                ),
              ),
              if (!_checkText)
                const Text("Email is no valid !",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: _login,
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
