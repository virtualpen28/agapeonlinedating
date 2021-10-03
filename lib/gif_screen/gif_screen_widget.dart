import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GifScreenWidget extends StatefulWidget {
  GifScreenWidget({Key key}) : super(key: key);

  @override
  _GifScreenWidgetState createState() => _GifScreenWidgetState();
}

class _GifScreenWidgetState extends State<GifScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Image.network(
                'https://i.postimg.cc/cCLyd3sX/pen-only-no-loop-with-end-2.gif',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
