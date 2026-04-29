import 'package:flutter/material.dart';
class KeyboardAware extends StatefulWidget {
  final Widget child;
  final FocusNode focusNode;
  final GlobalKey fieldKey;

  const KeyboardAware({
    super.key,
    required this.child,
    required this.focusNode,
    required this.fieldKey,
  });

  @override
  State<KeyboardAware> createState() => _KeyboardAwareState();
}

class _KeyboardAwareState extends State<KeyboardAware> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _scrollToField();
      }
    });
  }

  void _scrollToField() {
    Future.delayed(const Duration(milliseconds: 300), () {
      Scrollable.ensureVisible(
        widget.fieldKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: widget.child,
    );
  }
}