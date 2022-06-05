import 'package:flutter/material.dart';

class ElevatedButtonStyled extends StatelessWidget {
  const ElevatedButtonStyled(
      {Key? key,
      required this.onPressed,
      required this.background_color,
      required this.text,
      required this.width,
      required this.image,
      required this.text_color,
      })
      : super(key: key);
  final void Function() onPressed;
  final Color background_color;
  final Color text_color;
  final String text;
  final double width;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      height: 40,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(background_color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child:  Center(child: image == null ?Text(
          text,
          style:  TextStyle(
              fontFamily: 'RedHatDisplay', fontWeight: FontWeight.bold,color: text_color),
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(image!),
          const SizedBox(width: 4,),
          Text(text,style:  TextStyle(
              fontFamily: 'RedHatDisplay', fontWeight: FontWeight.bold, color: text_color),) 
        ]),)
      ),
    );
  }
}
