import 'package:flutter/material.dart';
import 'package:test_task_for_interview/helper/helper.dart';


class TextFieldStyled extends StatelessWidget {
  const TextFieldStyled({
    Key? key,
    this.icon,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.padding,
    required this.topText,
    this.obsecurity = false,
  }) : super(key: key);
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Icon? icon;
  final String labelText;
  final String topText;
  final validator;
  final padding;
  final bool obsecurity;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(topText,style: const TextStyle(
          fontSize:13,
      fontFamily: 'RedHatDisplay', fontWeight: FontWeight.w600, color: Colors.black87),),
          const SizedBox(height: 5,),
          TextFormField(
            
              // cursorColor: Colors.black,
              
              style: const TextStyle(
   fontSize: 13,
      fontFamily: 'RedHatDisplay', fontWeight: FontWeight.w600, color: Colors.black87),
              obscureText: obsecurity,
              controller: controller,
              // keyboardAppearance: ,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                
                fillColor: Colors.grey.shade300,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                filled: true,
                
                focusColor: Colors.black,
                // disabledBorder:
                // ,
                border: OutlineInputBorder(
                    borderSide:BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                prefixIcon: icon,
                labelText: labelText,
              ),
              validator: validator),
        ],
      ),
    );
  }
}
