import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget{
  const LoginForm({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Email / Phone / Username',
                  border: OutlineInputBorder() 
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder() 
                ),
              ),
            ]
          )
        ),

        const SizedBox(height: 10),

        TextButton(onPressed: () => {}, child: const Text("Forgot password?")),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text("Sign in")),
        ),
        
        const SizedBox(
          height: 30,
          child: Align(
            alignment: Alignment.center,
            child: Text("OR"),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text("Sign in with Google")),
        ),

      ],
    );
  }
}