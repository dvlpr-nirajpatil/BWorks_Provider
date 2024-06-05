import 'package:billionworks/consts/db_collections.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/models/forms_models/service_details_model.dart';
import 'package:billionworks/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceController extends ChangeNotifier {
  bool is_loading = false;
  String? img_url;

  bool is_uplading = false;

  set loading(value) {
    is_loading = value;
    notifyListeners();
  }

  ServiceDetailsModel serviceDetails = ServiceDetailsModel();

  pickServiceImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      serviceDetails.serviceImage = image;
      notifyListeners();
    }
  }

  removeImage() {
    serviceDetails.serviceImage = null;
    notifyListeners();
  }

  addService() async {
    loading = true;
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    await db.collection(DbCollections.services).add({
      'provider_id': auth.currentUser!.uid,
      'name': serviceDetails.serviceName.text,
      'category': serviceDetails.selectedCategory,
      'img': await StorageService.uploadImageToFirebase(
          serviceDetails.serviceImage!),
      'type': serviceDetails.selectedType,
      'status': serviceDetails.selectedStatus,
      'price': serviceDetails.price.text,
      'time': {
        'hour': serviceDetails.hours.text,
        'min': serviceDetails.min.text,
      },
      'desc': serviceDetails.desc.text
    });

    loading = false;
  }
}
