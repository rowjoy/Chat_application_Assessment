
// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/theme/extra_colors.dart';
import '../../../core/utils/validator.dart';
import '../../data/services/auth_services.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../userlist_views/user_list_views.dart';

class LoginBody {
  late AuthService authService;
  LoginBody({required this.authService});
  final authformKey = GlobalKey<FormState>();
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  final isloading = useState(false);
  view (BuildContext context){
     return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: authformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message,size: 100,),
                Text("Chat application"),
                SizedBox(height: 20,),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  validator: (p0) => AppValidator.isValidEmail(p0.toString()),
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                  validator: (p0) => AppValidator.isValidPassword(p0.toString()),
                ),
                SizedBox(height: 20,),
                CustomButton(
                  //buttonLevel: "Login",
                  btnwidget: isloading.value == true ? CircularProgressIndicator() : Text("Login",style: TextStyle(color: ExtraColors.whiteColors),) ,
                  onPressed: () async{
                     if(authformKey.currentState!.validate()){
                        authformKey.currentState!.save();
                        isloading.value = true;
                        try {
                            final responce =  await authService.signInWithEmailAndPassword( emailController.text, passwordController.text);
                            if(responce!.email != null){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserListViews()));
                            }
                          }catch(e){
                             await authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
                        }
                        isloading.value = false;
                     }
                  },
                  color: ExtraColors.redColors,
                ),

                TextButton(
                  onPressed: (){

                  }, 
                  child: Text("Created new account")
                )
              ],
            ),
          ),
        )
      );
  }
}