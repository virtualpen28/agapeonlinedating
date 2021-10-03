import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipingMatchesWidget extends StatefulWidget {
  SwipingMatchesWidget({Key key}) : super(key: key);

  @override
  _SwipingMatchesWidgetState createState() => _SwipingMatchesWidgetState();
}

class _SwipingMatchesWidgetState extends State<SwipingMatchesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Image.network(
              'https://picsum.photos/seed/462/600',
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
