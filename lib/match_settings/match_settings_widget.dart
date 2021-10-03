import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../gif_screen/gif_screen_widget.dart';
import '../main.dart';
import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchSettingsWidget extends StatefulWidget {
  MatchSettingsWidget({Key key}) : super(key: key);

  @override
  _MatchSettingsWidgetState createState() => _MatchSettingsWidgetState();
}

class _MatchSettingsWidgetState extends State<MatchSettingsWidget>
    with TickerProviderStateMixin {
  PageController pageViewController;
  String dropDownValue;
  double sliderValue1;
  double sliderValue2;
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
            child: PageView(
              controller: pageViewController ??= PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
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
                                        0, 15, 0, 0),
                                    child: Text(
                                      'Match Settings',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF303030),
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
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 48,
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xFF747373),
                                  size: 20,
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
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/517/600',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.5,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 4),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.92, 0.2),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 6, 0),
                                        child: Text(
                                          'Age',
                                          textAlign: TextAlign.start,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.3, -0.1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 0, 0),
                                            child: Text(
                                              '18',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.143,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-0.6, -0.1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
                                            child: Text(
                                              '80',
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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 14, 0),
                                    child: Slider(
                                      activeColor: Color(0xFF4B39EF),
                                      inactiveColor: Color(0x6D4B39EF),
                                      min: 10,
                                      max: 50,
                                      value: sliderValue1 ??= 10,
                                      label: sliderValue1.toString(),
                                      divisions: 4,
                                      onChanged: (newValue) {
                                        setState(() => sliderValue1 = newValue);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 4),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.92, 0.2),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Text(
                                          'Distance of {City, State}',
                                          textAlign: TextAlign.start,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 250, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.14,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(1, -0.1),
                                              child: Text(
                                                '10 mi',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.14,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1, -0.1),
                                            child: Text(
                                              '50 mi',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 14, 0),
                                  child: Slider(
                                    activeColor: Color(0xFF4B39EF),
                                    inactiveColor: Color(0x6D4B39EF),
                                    min: 10,
                                    max: 50,
                                    value: sliderValue2 ??= 10,
                                    label: sliderValue2.toString(),
                                    divisions: 4,
                                    onChanged: (newValue) {
                                      setState(() => sliderValue2 = newValue);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 130, 0),
                                  child: FlutterFlowDropDown(
                                    initialOption: dropDownValue ??=
                                        'Denomination',
                                    options: [
                                      'Denomination',
                                      'Pentecostal',
                                      'Catholic',
                                      'Baptist',
                                      'Non-denominational'
                                    ].toList(),
                                    onChanged: (val) =>
                                        setState(() => dropDownValue = val),
                                    width: 200,
                                    height: 40,
                                    textStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF303030),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: Colors.white,
                                    borderWidth: 0,
                                    borderRadius: 0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        8, 4, 8, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 15, 250, 0),
                                  child: FlutterFlowRadioButton(
                                    options: ['Men', 'Women'],
                                    onChanged: (value) {
                                      setState(() => radioButtonValue = value);
                                    },
                                    optionHeight: 50,
                                    textStyle: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                    ),
                                    selectedTextStyle: GoogleFonts.getFont(
                                      'Poppins',
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.vertical,
                                    radioButtonColor: Color(0xFF4B39EF),
                                    inactiveRadioButtonColor: Color(0xFF303030),
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      170, 0, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GifScreenWidget(),
                                        ),
                                      );
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'SwipingMatches'),
                                        ),
                                      );
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFFEF394A),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ).animated([
                                    animationsMap['buttonOnPageLoadAnimation']
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Image.network(
                  'https://picsum.photos/seed/88/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/570/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
