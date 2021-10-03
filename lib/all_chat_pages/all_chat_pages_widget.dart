import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllChatPagesWidget extends StatefulWidget {
  AllChatPagesWidget({Key key}) : super(key: key);

  @override
  _AllChatPagesWidgetState createState() => _AllChatPagesWidgetState();
}

class _AllChatPagesWidgetState extends State<AllChatPagesWidget> {
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
                                      6, 15, 0, 0),
                                  child: Text(
                                    'Chats',
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
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.43, 0.13),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                              child: Text(
                                'Once you get matches, you can start chatting. Start sliding!',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFC9C9C9),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 14, 10, 200),
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where('users',
                                        arrayContains: currentUserReference)
                                    .orderBy('last_message_time',
                                        descending: true),
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
                                List<ChatsRecord> listViewChatsRecordList =
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
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return FutureBuilder<UsersRecord>(
                                      future: () async {
                                        final chatUserRef = FFChatManager
                                            .instance
                                            .getChatUserRef(
                                                currentUserReference,
                                                listViewChatsRecord);
                                        return UsersRecord.getDocument(
                                                chatUserRef)
                                            .first;
                                      }(),
                                      builder: (context, snapshot) {
                                        final chatUser = snapshot.data;
                                        return FFChatPreview(
                                          onTap: chatUser != null
                                              ? () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatPageWidget(
                                                        chatUser: chatUser,
                                                      ),
                                                    ),
                                                  )
                                              : null,
                                          lastChatText:
                                              listViewChatsRecord.lastMessage,
                                          lastChatTime: listViewChatsRecord
                                              .lastMessageTime,
                                          seen: listViewChatsRecord
                                              .lastMessageSeenBy
                                              .contains(currentUserReference),
                                          userName: chatUser?.displayName ?? '',
                                          userProfilePic:
                                              chatUser?.photoUrl ?? '',
                                          color: Color(0xFFEEF0F5),
                                          unreadColor: Colors.blue,
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Poppins',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                          dateTextStyle: GoogleFonts.getFont(
                                            'Poppins',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                          previewTextStyle: GoogleFonts.getFont(
                                            'Poppins',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 3, 3, 3),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        );
                                      },
                                    );
                                  },
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
            )
          ],
        ),
      ),
    );
  }
}
