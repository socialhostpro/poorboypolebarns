import '/dashboard/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contacts_widget.dart' show ContactsWidget;
import 'package:flutter/material.dart';

class ContactsModel extends FlutterFlowModel<ContactsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }
}
