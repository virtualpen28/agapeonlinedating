import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchesWidget extends StatefulWidget {
  MatchesWidget({Key key}) : super(key: key);

  @override
  _MatchesWidgetState createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 65,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 15, 0, 0),
                                      child: Text(
                                        'Matches',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 15, 2),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Slidable(
                        actionPane: const SlidableScrollActionPane(),
                        secondaryActions: [
                          IconSlideAction(
                            caption: 'Chat',
                            color: Color(0xFF4B39EF),
                            icon: Icons.share,
                            onTap: () {
                              print('SlidableActionWidget pressed ...');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Erase',
                            color: Color(0xFFEF394A),
                            icon: FontAwesomeIcons.trashAlt,
                            onTap: () {
                              print('SlidableActionWidget pressed ...');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Profile',
                            color: Color(0xFFEFF33D),
                            icon: Icons.people_outlined,
                            onTap: () {
                              print('SlidableActionWidget pressed ...');
                            },
                          )
                        ],
                        child: ListTile(
                          title: Text(
                            'Match Name, Age',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          subtitle: Text(
                            'City, State',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(80, 0, 25, 0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
