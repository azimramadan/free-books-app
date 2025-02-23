import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Started',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Please fill your details to login.'),
            ),
            TextField(),
            SizedBox(height: 50),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300], // لون الخلفية
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // حواف مستديرة
                  borderSide: BorderSide.none, // بدون حدود
                ),
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(true ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
