import 'package:flutter/material.dart';
import 'package:hsk_flutter/res/resources.dart';
//import 'package:flutter_deer/util/theme_utils.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    this.text = '',
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // final bool isDark = ThemeUtils.isDark(context);
    return FlatButton(
      onPressed: onPressed,

      textColor: Colors.white, //isDark ? Colours.dark_button_text :
      color: Colours.app_main, //isDark ? Colours.dark_app_main :
      disabledTextColor:
          Colours.text_disabled, //isDark ? Colours.dark_text_disabled :
      disabledColor:
          Colours.button_disabled, //isDark ? Colours.dark_button_disabled :
      //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colours.app_main,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
