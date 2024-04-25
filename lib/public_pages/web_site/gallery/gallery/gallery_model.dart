import '/components/footer/footer_widget.dart';
import '/components/why/why_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gallery_widget.dart' show GalleryWidget;
import 'package:flutter/material.dart';

class GalleryModel extends FlutterFlowModel<GalleryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for why component.
  late WhyModel whyModel;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    whyModel = createModel(context, () => WhyModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    whyModel.dispose();
    footerModel.dispose();
  }
}
