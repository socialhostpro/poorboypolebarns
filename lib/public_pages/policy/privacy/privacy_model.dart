import '/flutter_flow/flutter_flow_util.dart';
import 'privacy_widget.dart' show PrivacyWidget;
import 'package:flutter/material.dart';

class PrivacyModel extends FlutterFlowModel<PrivacyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
