import 'package:flutter/material.dart';

@immutable
class SignInButtonBuilder extends StatelessWidget {
  /// This is a builder class for signin button
  ///
  /// Icon can be used to define the signin method
  /// User can use Flutter built-in Icons or font-awesome flutter's Icon
  final IconData icon;

  /// `mini` tag is used to switch from a full-width signin button to
  final bool mini;

  /// the button's text
  final String text;

  /// backgroundColor is required but textColor is default to `Colors.white`
  /// splashColor is defalt to `Colors.white30`
  final Color textColor, backgroundColor, splashColor;

  /// onPressed should be specified as a required field to indicate the callback.
  final Function onPressed;

  /// padding is default to `EdgeInsets.all(3.0)`
  final EdgeInsets padding;

  /// shape is to specify the custom shape of the widget.
  /// However the flutter widgets contains restriction or bug
  /// on material button, hence, comment out.
  final ShapeBorder shape;

  /// elevation has defalt value of 2.0
  final double elevation;

  /// width is default to be 1/1.5 of the screen
  final double width;

  final bool iconOnly;

  /// The constructor is self-explanatory.
  SignInButtonBuilder({
    Key key,
    @required this.icon,
    @required this.backgroundColor,
    @required this.onPressed,
    @required this.text,
    this.textColor = Colors.white,
    this.splashColor = Colors.white30,
    this.padding = const EdgeInsets.all(3.0),
    this.mini = false,
    this.elevation = 2.0,
    this.shape,
    this.width = null,
    this.iconOnly = false,
  })  : assert(text != null),
        assert(icon != null),
        assert(textColor != null),
        assert(backgroundColor != null),
        assert(onPressed != null),
        assert(mini != null),
        assert(elevation != null);

  /// The build funtion will be help user to build the signin button widget.
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: mini ? 35.0 : null,
      elevation: elevation,
      padding: padding,
      color: backgroundColor,
      onPressed: onPressed,
      splashColor: splashColor,
      child: mini
          ? Container(
              width: 35.0,
              height: 35.0,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : Container(
              constraints: BoxConstraints(
                maxWidth: width ?? MediaQuery.of(context).size.width / 1.5,
                minHeight: 40.0,
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                      padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            text,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ),
                  ],
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                ),
              ),
            ),
      shape: shape ?? ButtonTheme.of(context).shape,
    );
  }
}
