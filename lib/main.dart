import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iug_firebase/app_provider.dart';
import 'package:iug_firebase/auth_provider.dart';
import 'package:iug_firebase/firestore_provider.dart';
import 'package:iug_firebase/iug_user.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
    Provider<FirestoreProvider>(
      create: (context) => FirestoreProvider(),
    ),
    Provider<AppProvider>(
      create: (context) => AppProvider(context: context),
    ),
  ], child: MaterialApp(home: FirebaseTest())));
}

class FirebaseTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                // IugUser iugUser = IugUser(
                //     password: '123456',
                //     fName: 'husam',
                //     lName: 'ezz',
                //     city: 'jabalia',
                //     email: 'hussam@gmail.com');
                Provider.of<AppProvider>(context, listen: false)
                    .login('saeed@gmail.com','123456');
                // Provider.of<FirestoreProvider>(context, listen: false)
                // .getOneUserFromFirestore('Tz3ccDFpeIBhqk2ATgB6');
                // Provider.of<AuthProvider>(context, listen: false)
                //     .createNewAccount('omar@gmail.com', 'qqqqqqqq');
              },
              child: Text('SignUp')),
        ));
  }
}
