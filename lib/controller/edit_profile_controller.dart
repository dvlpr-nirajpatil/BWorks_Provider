import 'dart:developer';

import 'package:billionworks/consts/db_collections.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  XFile? profileImage;
  String? imageUrl;

  bool isLoading = false;

  set loading(value) {
    isLoading = value;
    notifyListeners();
  }

  pickProfilePicture() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = pickedImage;
      String? url = await StorageService.uploadImageToFirebase(pickedImage);
      if (url != null) {
        FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
        log("Profile Picture Added");
      }
      notifyListeners();
    }
  }

  updateProfile({name, phone}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    loading = true;
    await db
        .collection(DbCollections.provider)
        .doc(uid)
        .update({'name': name, 'contact': phone});

    auth.currentUser!.updateDisplayName(name);
    loading = false;
  }
}
