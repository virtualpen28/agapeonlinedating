import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:agape_online_dating/login_signup_screen/login_signup_screen_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'profile/profile_widget.dart';
import 'matches/matches_widget.dart';
import 'swiping_matches/swiping_matches_widget.dart';
import 'all_chat_pages/all_chat_pages_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<AgapeOnlineDatingFirebaseUser> userStream;
  AgapeOnlineDatingFirebaseUser initialUser;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = agapeOnlineDatingFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agape online dating',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xFF4B39EF),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginSignupScreenWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Profile';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Profile': ProfileWidget(),
      'Matches': MatchesWidget(),
      'SwipingMatches': SwipingMatchesWidget(),
      'AllChatPages': AllChatPagesWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 26,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.fire,
              size: 21,
            ),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swipe,
              size: 24,
            ),
            label: 'Swipping',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              size: 24,
            ),
            label: 'Chats',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFFEF394A),
        unselectedItemColor: Color(0x8A000000),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
