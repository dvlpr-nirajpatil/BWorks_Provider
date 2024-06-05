import 'dart:developer';
import 'package:billionworks/consts/db_collections.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/views/shared_widgets/snackbar/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isloading = false;

  set loading(bool value) {
    isloading = value;
    notifyListeners();
  }

  Future<UserCredential?> userSignIn(context,
      {String? email, String? password}) async {
    UserCredential? user;
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      log(e.code, name: "AUTH ERROR");
      if (e.code == "invalid-credential") {
        showSnackbar(context, "Please enter a valid email and password.");
      } else if (e.code == "wrong-password") {
        showSnackbar(context, "Invalid Password");
      } else if (e.code == "invalid-email") {
        showSnackbar(context, "Invalid email address.");
      } else if (e.code == "channel-error") {
        showSnackbar(context, "Something went wrong check your credentials.");
      } else {
        showSnackbar(context, "Something went wrong .");
      }
    }
    return user;
  }

  Future<UserCredential?> userSignUp(context,
      {String? email, String? password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? user;
    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "invalid-email") {
        showSnackbar(context, "Invalid Email id.");
      } else if (e.code == "email-already-in-use") {
        showSnackbar(context, "This email id already exists!");
      } else if (e.code == "weak-password") {
        showSnackbar(context, "weak password! Please enter a strong password");
      }
    }
    return user;
  }

  Future<void> userSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> forgetPassword(context, email) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackbar(context,
          "We've just sent a password reset email to your registered email address. Please check your inbox and follow the instructions to reset your password. If you don't see the email, kindly check your spam folder. For any assistance, feel free to contact our support team.");
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, "Check your email.");
    }
  }

  void storeProviderDetails({fullName, email, contact}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    var userid = auth.currentUser!.uid;
    auth.currentUser!.updateDisplayName(fullName);

    await db.collection(DbCollections.provider).doc(userid).set({
      'name': fullName,
      'email': email,
      'contact': contact,
      'uid': userid,
      'date_time': Timestamp.now()
    });
  }
}
