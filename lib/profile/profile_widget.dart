import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../settings/settings_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
          List<UserInterfaceRecord> profileUserInterfaceRecordList =
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
          final profileUserInterfaceRecord =
              profileUserInterfaceRecordList.first;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 160, 4),
                                  child: Image.network(
                                    'https://i.postimg.cc/Wz2tM4kL/just-logo-agape.png',
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 85,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 46,
                                icon: Icon(
                                  Icons.settings_outlined,
                                  color: Color(0xFF747373),
                                  size: 26,
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SettingsWidget(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.65, -1.06),
                            child: InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  pickerFontFamily: 'Poppins',
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl1 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Image.network(
                                'https://us.123rf.com/450wm/krikhill/krikhill1904/krikhill190400255/120490511-pop-art-color-background-memphis-pattern-of-geometric-shapes-for-tissue-and-postcards-vector-illustr.jpg?ver=6',
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.56),
                            child: InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  pickerFontFamily: 'Poppins',
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl2 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 110,
                                height: 110,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoNGzkjDNQCfvHfmSFzuXcrAB2IkN0x3mZEQ&usqp=CAU',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60, 0, 0, 0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        profileUserInterfaceRecord.displayName),
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
                                      final textUsersRecord = snapshot.data;
                                      return Text(
                                        textUsersRecord.displayName,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF4B4A4A),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  profileUserInterfaceRecord.age,
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4B39EF),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          140, 0, 0, 0),
                                      child: Text(
                                        profileUserInterfaceRecord.city,
                                        textAlign: TextAlign.center,
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF303030),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ',',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Text(
                                      profileUserInterfaceRecord.state,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Text(
                                        profileUserInterfaceRecord
                                            .profileDescription,
                                        textAlign: TextAlign.center,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF303030),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.75, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 46,
                                                icon: Icon(
                                                  Icons.person_outlined,
                                                  color: Color(0xFF4B39EF),
                                                  size: 24,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.1, 0.05),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(13, 0,
                                                                    2, 0),
                                                        child: Text(
                                                          profileUserInterfaceRecord
                                                              .height,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Text(
                                                        ',',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      profileUserInterfaceRecord
                                                          .kids,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Text(
                                                        ',',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      profileUserInterfaceRecord
                                                          .wantKids,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Text(
                                                        '&',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      profileUserInterfaceRecord
                                                          .mStatus,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
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
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 3, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: FaIcon(
                                          FontAwesomeIcons.cross,
                                          color: Color(0xFF4B39EF),
                                          size: 19,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          profileUserInterfaceRecord
                                              .denomination,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: Text(
                                          ',',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        profileUserInterfaceRecord.church,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 2, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: FaIcon(
                                          FontAwesomeIcons.graduationCap,
                                          color: Color(0xFF4B39EF),
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.4, 0.05),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    11, 0, 0, 0),
                                            child: Text(
                                              profileUserInterfaceRecord
                                                  .ocupation,
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
                                          child: Text(
                                            ',',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          profileUserInterfaceRecord
                                              .levelOfStudy,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.4, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-0.1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 2, 6, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: FaIcon(
                                            FontAwesomeIcons.addressCard,
                                            color: Color(0xFF4B39EF),
                                            size: 17,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.8, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 0, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.75, 0.05),
                                                child: Text(
                                                  profileUserInterfaceRecord
                                                      .whereGrewUp,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 4, 0),
                                                child: Text(
                                                  ',',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                profileUserInterfaceRecord
                                                    .userLenguage,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.3, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: FaIcon(
                                          FontAwesomeIcons.glassCheers,
                                          color: Color(0xFF4B39EF),
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      profileUserInterfaceRecord.drink,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Text(
                                      ',',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    profileUserInterfaceRecord.smoke,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Text(
                                      ',',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    profileUserInterfaceRecord.firstDatePlan,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 2, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: FaIcon(
                                          FontAwesomeIcons.gamepad,
                                          color: Color(0xFF4B39EF),
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.8, 0.05),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 92, 0),
                                        child: Text(
                                          profileUserInterfaceRecord
                                              .whatDoYouLikeToDo,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.person_search_outlined,
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 0, 0, 0),
                                  child: Text(
                                    'I\'m looking for ',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Text(
                                  profileUserInterfaceRecord.gender,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Text(
                                    ',',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Text(
                                  profileUserInterfaceRecord.age,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Text(
                                    ',',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Text(
                                  profileUserInterfaceRecord.rGoal,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: FlutterFlowTheme.primaryColor,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                            child: Text(
                              'Within ',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                            child: Text(
                              profileUserInterfaceRecord.mileDistance,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                            child: Text(
                              'of',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Text(
                            profileUserInterfaceRecord.city,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: Text(
                              ',',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Text(
                            profileUserInterfaceRecord.state,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 16, 10, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xD7FFFFFF),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.17,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.65, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: Icon(
                                          Icons.add_box_sharp,
                                          color: Color(0xFFEF394A),
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          final userInterfaceCreateData =
                                              createUserInterfaceRecordData(
                                            whatYouThink: '',
                                          );
                                          await UserInterfaceRecord.collection
                                              .doc()
                                              .set(userInterfaceCreateData);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.1, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.15, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 6, 0, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'What are you thinking?',
                                          hintStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                        textAlign: TextAlign.start,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Field is required';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          Image.network(
                            'https://picsum.photos/seed/498/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/94/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/390/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/401/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/285/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/29/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
