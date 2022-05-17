import 'package:flutter/cupertino.dart';
import 'package:iug_firebase/auth_provider.dart';
import 'package:iug_firebase/firestore_provider.dart';
import 'package:iug_firebase/iug_user.dart';
import 'package:provider/provider.dart';

class AppProvider {
  BuildContext context;
  AppProvider({required this.context});
  register(IugUser iugUser) async {
    String? id = await Provider.of<AuthProvider>(context, listen: false)
        .createNewAccount(iugUser);

    if (id != null) {
      iugUser.id = id;
      Provider.of<FirestoreProvider>(context, listen: false)
          .addUserToFirestore(iugUser);
    }
  }

  login(String email, String password) async {
    String? id = await Provider.of<AuthProvider>(context, listen: false)
        .login(email, password);
    if (id != null) {
      Provider.of<FirestoreProvider>(context, listen: false)
          .getOneUserFromFirestore(id);
    }
  }
}
