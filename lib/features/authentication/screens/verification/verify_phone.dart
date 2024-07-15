import 'package:flutter/material.dart';

class VerifyPhone extends StatelessWidget{
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Added Scaffold here
      appBar: AppBar(
        title: const Text('Verify Phone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Confirm"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}