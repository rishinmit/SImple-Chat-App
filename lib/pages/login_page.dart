import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texting_app/components/my_button.dart';
import 'package:texting_app/components/my_text_field.dart';
import 'package:texting_app/services/auth/auth.service.dart';

class LoginPage extends StatefulWidget {
  final void Function()?onTap;
  const LoginPage({
    super.key,
    required this.onTap,
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signin() async {
    final authService =  Provider.of<AuthService>(context,listen:false);

    try{
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 10), 

          Icon(
            Icons.message,
            size: 80,
            color: Colors.grey[800],
          ),
          const Text("Welcome Back",
          style: TextStyle(
            fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          MyTextField(
            controller: emailController, 
            hintText: 'Email', 
            obscureText: false,
            ),

            const SizedBox(height: 25),

          MyTextField(
            controller: passwordController, 
            hintText: 'Password', 
            obscureText: true,
            ),

            const SizedBox(height: 15,),

            MyButton(
              onTap: signin, 
              text: "Sign In"),
            
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Not a member?'),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Register now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],)
        ],),
      ),),
    );
  }
}