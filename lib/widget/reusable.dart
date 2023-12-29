import 'package:flutter/material.dart';

TextField reusableTextField(
  String text,
  IconData icon,
  TextEditingController controller,
  bool isPasswordType,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black, // Adjusted cursor color
    style: TextStyle(color: Colors.black), // Adjusted text color
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.black), // Adjusted icon color
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)), // Adjusted label color
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 11, 4, 4).withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(38.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signinSignUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      onPressed: () => onTap(),
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Color.fromARGB(255, 122, 194, 207);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}
