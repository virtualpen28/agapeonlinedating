import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AgapeOnlineDatingFirebaseUser {
  AgapeOnlineDatingFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

AgapeOnlineDatingFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AgapeOnlineDatingFirebaseUser> agapeOnlineDatingFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AgapeOnlineDatingFirebaseUser>(
            (user) => currentUser = AgapeOnlineDatingFirebaseUser(user));
