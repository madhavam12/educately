import 'package:flutter/material.dart';

class GetTextField extends StatelessWidget {
  final FocusNode focusNode;

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData iconData;
  const GetTextField(
      {Key key,
      @required this.iconData,
      @required this.controller,
      @required this.hintText,
      @required this.labelText,
      @required this.focusNode})
      : super(key: key);

  getkeyboardType() {
    if (labelText == "Phone Number") {
      return TextInputType.number;
    } else if (labelText == "Email") {
      return TextInputType.emailAddress;
    } else {
      return TextInputType.name;
    }
  }

  getMaxLength() {
    if (labelText == "Phone Number") {
      return 10;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: getkeyboardType(),
        onSubmitted: (String name) {
          // _titleFocus.unfocus();
          // FocusScope.of(context).requestFocus(_descFocus);
        },
        maxLength: getMaxLength(),
        cursorColor: Colors.black,
        style: TextStyle(
            fontSize: 17.5, fontWeight: FontWeight.normal, color: Colors.black),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            fontSize: 10,
            color: Colors.black,
          ),
          prefixIcon: Icon(iconData, color: Colors.black),
          filled: true,
          labelText: labelText,
          hintText: hintText,
          fillColor: Color(0xFFeae9e0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
