import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {Key key, this.text = "", this.highlight = false, this.onPressed})
      : super(key: key);
  final String text;
  final bool highlight;
  final VoidCallback onPressed;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _active = false;

  void _handleOnTapDown(tapDownDetails) {
    setState(() {
      _active = true;
    });
  }

  void _handleOnTapUp(tapUpDetails) {
    if (widget.onPressed != null) widget.onPressed();
    setState(() {
      _active = false;
    });
  }

  Color _getColor() {
    if (_active) {
      if (widget.highlight) {
        return Color.fromRGBO(248, 248, 153, 1);
      } else {
        return Color.fromRGBO(0, 0, 0, 0.25);
      }
    } else {
      if (widget.highlight) {
        return Colors.white;
      } else {
        return Color.fromRGBO(0, 0, 0, 0.5);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleOnTapDown,
      onTapUp: _handleOnTapUp,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: _getColor(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                color: widget.highlight
                    ? Color.fromRGBO(198, 83, 141, 1)
                    : _active
                        ? Color.fromRGBO(255, 255, 255, 0.5)
                        : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
