import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texting_app/components/my_button.dart';
import 'package:texting_app/components/my_text_field.dart';
import 'package:texting_app/services/auth/auth.service.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signup() async{
    if(passwordController.text !=  confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:Text("Passwords don't match man"),),);
        return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch(e){
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
          const Text("Let's get started",
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
            hintText: 'Enter Password', 
            obscureText: true,
            ),

            const SizedBox(height: 15,),
            
            MyTextField(
            controller: confirmPasswordController, 
            hintText: 'Re-enter Password', 
            obscureText: true,
            ),

            const SizedBox(height: 15,),

            MyButton(
              onTap: signup, 
              text: "Sign Up"),
            
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Already a member?'),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Login now',
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