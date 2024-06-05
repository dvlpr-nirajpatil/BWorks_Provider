import 'package:billionworks/consts/db_collections.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/models/forms_models/handyman_details_model.dart';
import 'package:billionworks/views/shared_widgets/snackbar/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HandymanController extends ChangeNotifier {
  bool isLoading = false;
  HandymanDetailsModel model = HandymanDetailsModel();

  FirebaseFirestore database = FirebaseFirestore.instance;

  set loading(val) {
    isLoading = val;
    notifyListeners();
  }

  addHandyman(context) async {
    loading = true;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: model.email.text, password: model.password.text);
      await storeHandymanData(user.user!.uid);
      showSnackbar(context, "New Handyman Added Successfully.");
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        showSnackbar(context, "Invalid Email id.");
      } else if (e.code == "email-already-in-use") {
        showSnackbar(context, "This email id already exists!");
      } else if (e.code == "weak-password") {
        showSnackbar(context, "weak password! Please enter a strong password");
      }
    }
    loading = false;
  }

  storeHandymanData(uid) {
    database.collection(DbCollections.handyman).doc(uid).set({
      'name': model.fullname.text,
      'email': model.email.text,
      'phone': model.phoneNumber.text,
      'city': model.city.text,
      'rating': 0.0,
      'status': 'InActive'
    });
  }
}
