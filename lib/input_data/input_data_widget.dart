import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDataWidget extends StatefulWidget {
  InputDataWidget({Key key}) : super(key: key);

  @override
  _InputDataWidgetState createState() => _InputDataWidgetState();
}

class _InputDataWidgetState extends State<InputDataWidget> {
  TextEditingController textController;
  UserInterfaceRecord Age;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserInterfaceRecord>>(
      stream: queryUserInterfaceRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFF4B39EF),
              ),
            ),
          );
        }
        List<UserInterfaceRecord> inputDataUserInterfaceRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          return Material(
            child: Container(
              height: 100,
              child: Center(
                child: Text('No results.'),
              ),
            ),
          );
        }
        final inputDataUserInterfaceRecord =
            inputDataUserInterfaceRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -0.78),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          final userInterfaceCreateData =
                              createUserInterfaceRecordData(
                            age: textController.text,
                          );
                          final userInterfaceRecordReference =
                              UserInterfaceRecord.collection.doc();
                          await userInterfaceRecordReference
                              .set(userInterfaceCreateData);
                          Age = UserInterfaceRecord.getDocumentFromData(
                              userInterfaceCreateData,
                              userInterfaceRecordReference);

                          setState(() {});
                        },
                      ),
                      Expanded(
                        child: StreamBuilder<List<UserInterfaceRecord>>(
                          stream: queryUserInterfaceRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF4B39EF),
                                  ),
                                ),
                              );
                            }
                            List<UserInterfaceRecord>
                                textFieldUserInterfaceRecordList =
                                snapshot.data;
                            // Customize what your widget looks like with no query results.
                            if (snapshot.data.isEmpty) {
                              return Material(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('No results.'),
                                  ),
                                ),
                              );
                            }
                            final textFieldUserInterfaceRecord =
                                textFieldUserInterfaceRecordList.first;
                            return TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Age',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
