import 'package:flutter/material.dart';

Widget myTextFormField({
  required String labelText,
  required IconData prefixIcon,
  required double padding,
  IconData? suffixIcon,
  bool obscureText = false,
  required String? Function(String?)? validator,
  required TextEditingController controller,
  required TextInputType keyboardtype,
}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextFormField(
      keyboardType: keyboardtype,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)),
           // borderSide: BorderSide(width: 2)),
        labelText: labelText,
        suffixIcon:suffixIcon != null?
         IconButton(onPressed: () {

        }, icon: Icon(suffixIcon))
        :null
      ),
      validator: validator ,
      controller: controller,
    ),
  );
}

// ignore: non_constant_identifier_names
Future MyNavigator({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  })
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 4, size.height - 40, size.width / 2, size.height - 20)
      ..quadraticBezierTo(
          3 / 4 * size.width, size.height, size.width, size.height - 30)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
