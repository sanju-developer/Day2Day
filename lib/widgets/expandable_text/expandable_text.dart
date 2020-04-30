import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: widget.isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: 200.0),
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      ConstrainedBox(constraints: BoxConstraints()),
      FlatButton(
          child: widget.isExpanded
              ? Text(
                  'less ...',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  'Read more ...',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
          onPressed: () =>
              setState(() => widget.isExpanded = !widget.isExpanded))
    ]);
  }
}
