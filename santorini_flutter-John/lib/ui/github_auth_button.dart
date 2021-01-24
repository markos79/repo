library flutter_button;

import 'package:flutter/material.dart';

class GithubAuthButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> shadows;
  final double fontSize;
  final double iconSize;
  final FontWeight fontWeight;
  final bool wOpacity;
  final bool wGradientColors;
  final double opacityValue;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;

  GithubAuthButton({
    @required this.onTap,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.borderRadius,
    this.shadows,
    this.fontSize,
    this.iconSize,
    this.wOpacity,
    this.fontWeight,
    this.wGradientColors,
    this.opacityValue,
    this.gradientColors,
    this.beginGradient,
    this.endGradient,
  });
  @override
  _GithubAuthButtonState createState() => _GithubAuthButtonState();
}

class _GithubAuthButtonState extends State<GithubAuthButton> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity != false && widget.wOpacity != null)
          ? buildButtonWOpacity()
          : buildButton(),
    );
  }

  Opacity buildButtonWOpacity() {
    return Opacity(
      opacity: _isTapped
          ? (widget.opacityValue == null)
              ? .7
              : widget.opacityValue
          : 1,
      child: buildButton(),
    );
  }

  Container buildButton() {
    return Container(
      decoration: buildBoxDecoration(),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            ///
            Text(
              ((widget.title != null) ? widget.title : "Github"),
              style: TextStyle(
                color: (widget.titleColor == null)
                    ? Colors.white
                    : widget.titleColor,
                fontSize: (widget.fontSize != null) ? widget.fontSize : 25,
                fontWeight: (widget.fontWeight != null)
                    ? widget.fontWeight
                    : FontWeight.w500,
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius != null)
          ? widget.borderRadius
          : BorderRadius.circular(10),
      gradient: (widget.wGradientColors == true)
          ? (widget.gradientColors != null)
              ? LinearGradient(
                  colors: widget.gradientColors,
                  begin: (widget.beginGradient != null)
                      ? widget.beginGradient
                      : Alignment.topRight,
                  end: (widget.endGradient != null)
                      ? widget.beginGradient
                      : Alignment.bottomLeft,
                )
              : LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Colors.blueGrey[900],
                  ],
                )
          : null,
      color: (widget.backgroundColor != null)
          ? widget.backgroundColor
          : Colors.black,
      boxShadow: (widget.shadows != null) ? widget.shadows : [],
    );
  }
}
