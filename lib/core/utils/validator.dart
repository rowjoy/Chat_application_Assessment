class AppValidator {
   

   static String? isValidEmail(String email) {  
      final RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
      );
      // return emailRegex.hasMatch(email);
      if (!emailRegex.hasMatch(email)){
         return "Please enter valid email";
      }
      return null;
    }

    static String? isValidPassword (String value){
       if (value.isEmpty){
         return "Please enter password";
       }
       return null;
       
    }

}