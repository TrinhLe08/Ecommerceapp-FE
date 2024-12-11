import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/change-password/page.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({super.key});

  @override
  ConfirmCodePageState createState() => ConfirmCodePageState();
}

class ConfirmCodePageState extends State<ConfirmCodePage> {
  final TextEditingController _codeController = TextEditingController();
  bool _checkText = true;

  void _login() {
    String code = _codeController.text;

    if (code.isEmpty) {
      setState(() {
        _checkText = false;
      });
      print('Error: $code');
    } else {
      setState(() {
        _checkText = true;
      });
      print('Logging in with code: $code  ');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
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
                'CONFIRM CODE',
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
                  controller: _codeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code :',
                    hintText: 'Enter your code ',
                  ),
                ),
              ),
              if (!_checkText)
                const Text("Code is no valid !",
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
