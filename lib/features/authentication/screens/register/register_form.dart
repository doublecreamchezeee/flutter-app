import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget{
  const RegisterForm({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Full Name',
                  border: OutlineInputBorder() 
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder() 
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone No',
                  hintText: 'Phone No',
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

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text("Sign up")),
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
          child: ElevatedButton(onPressed: () {}, child: const Text("Sign up with Google")),
        ),

      ],
    );
  }
}