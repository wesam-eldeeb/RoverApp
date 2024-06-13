import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IconColorChangeTextFieldDemo(),
    );
  }
}

class IconColorChangeTextFieldDemo extends StatefulWidget {
  @override
  _IconColorChangeTextFieldDemoState createState() =>
      _IconColorChangeTextFieldDemoState();
}

class _IconColorChangeTextFieldDemoState
    extends State<IconColorChangeTextFieldDemo> {
  bool _isTextFieldFocused = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Color Change TextField Demo'),
      ),
      body: Center(
        child: TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Enter text',
            prefixIcon: Icon(
              Icons.person,
              color: _isTextFieldFocused ? Colors.red : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
