// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombutton1 extends StatelessWidget {
  Custombutton1(
    void Function()? this.onPressed,
    String this.buttonlabel, {
    required Color this.buttonColor,
  });

  final VoidCallback? onPressed; // Good
  Color buttonColor;
  String buttonlabel;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
            width: 220,
            height: 40,
            color: buttonColor != null
                ? buttonColor
                : Theme.of(context).accentColor,
            child: Center(
                child: Text(
              buttonlabel,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 15),
            )),
          ),
        ));
  }
}

class Custombutton2 extends StatelessWidget {
  Custombutton2(
    void Function()? this.onPressed,
    String this.buttonlabel, {
    required Color this.buttonColor,
    required Icon this.icon,
  });

  final VoidCallback? onPressed; // Good
  Color buttonColor;
  String buttonlabel;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            color: buttonColor != null
                ? buttonColor
                : Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: icon,
                  ),
                  Text(
                    buttonlabel,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 15),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Icon(Icons.chevron_right, size: 35),
                ),
              ],
            ),
          ),
        ));
  }
}

class SimpleButton1 extends StatelessWidget {
  SimpleButton1(this.onPressed, this.label);

  final VoidCallback? onPressed;
  final String label; // Good

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              color: Color(0xff212121),
              child: Center(
                child: Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white, fontSize: 20)),
              )),
        ));
  }
}
