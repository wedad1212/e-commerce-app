import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldStyle extends StatelessWidget {
  TextFormFieldStyle(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.icon,
      this.validator,
      this.obscuretext,
      this.onTap, this.onSaved});
  final String labelText;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? obscuretext;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obscuretext == null || obscuretext == false ? false: true,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 20),
              )),
          hintText: hintText,
          suffixIcon: InkWell(onTap: onTap, child: Icon(icon)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
