import 'package:flutter/material.dart';

class FromRegister extends StatefulWidget {
  FromRegister({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.icons,
    this.isPassword = false,
    this.readOnly = false,
    this.keyboardType,
    this.validator,
    this.width,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? icons;
  final bool isPassword;
  final bool readOnly;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final double? width;

  @override
  State<FromRegister> createState() => _FromRegisterState();
}

class _FromRegisterState extends State<FromRegister> {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 5),
            width: widget.width,
            height: widget.keyboardType == TextInputType.multiline ? null : size.height * 0.085,
            child: TextFormField(
              maxLines: widget.keyboardType == TextInputType.multiline ? 5 : 1,
              // cursorColor: kPrimaryColor,
              controller: widget.controller,
              validator: widget.validator,
              readOnly: widget.readOnly,
              obscureText: widget.isPassword && !isObscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: widget.icons,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() => isObscureText = !isObscureText);
                        },
                        child: Icon(
                          !isObscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        ),
                      )
                    : null,
              ),
            )),
      ],
    );
  }
}
