// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:chatapplication/app/data/services/auth_provider.dart';
import 'package:chatapplication/app/views/userlist_views/user_list_views.dart';
import 'package:chatapplication/app/widgets/custom_button.dart';
import 'package:chatapplication/app/widgets/custom_textfield.dart';
import 'package:chatapplication/core/theme/extra_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViews extends HookConsumerWidget {
  const LoginViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authService = ref.watch(authServiceProvider);
    final isloading = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Email",
              ),
              SizedBox(height: 10,),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 20,),
              CustomButton(
                //buttonLevel: "Login",
                btnwidget: isloading.value == true ? CircularProgressIndicator() : Text("Login") ,
                onPressed: () async{
                   isloading.value = true;
                   try {
                     final responce =  await authService.signInWithEmailAndPassword( emailController.text, passwordController.text);
                     if(responce!.email != null){
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserListScreen()));
                     }
                   }catch(e){
                       print("Error $e");
                   }
                   isloading.value = false;
                },
                color: ExtraColors.redColors,
              ),
            ],
          ),
        )
      ),
    );
  }
}