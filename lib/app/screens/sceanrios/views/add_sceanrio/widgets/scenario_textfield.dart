import 'package:flutter/material.dart';

class ScenarioTextField extends StatelessWidget {
  final String? kLabelText;
  final IconData? kIcon;
  final TextEditingController? kTextController;
  final Function kValidatorFunction;
  final TextInputType? kInputType;
  final bool kObscureText;
  const ScenarioTextField({
    Key? key,
    this.kLabelText,
    this.kIcon,
    this.kTextController,
    required this.kValidatorFunction(String V),
    this.kInputType,
    required this.kObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: kTextController,
      // validator: (v) {
      //   return kValidatorFunction(v!);
      // },
      keyboardType: kInputType,
      obscureText: kObscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[350]),
        hintText: '$kLabelText',
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.only(left: 5.0, bottom: 10.0, top: 10.0),
        prefixIcon: Icon(kIcon),
      ),
    );
  }
}
