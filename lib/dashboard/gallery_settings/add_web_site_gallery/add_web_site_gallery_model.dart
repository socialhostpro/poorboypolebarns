import '/flutter_flow/flutter_flow_util.dart';
import 'add_web_site_gallery_widget.dart' show AddWebSiteGalleryWidget;
import 'package:flutter/material.dart';

class AddWebSiteGalleryModel extends FlutterFlowModel<AddWebSiteGalleryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
