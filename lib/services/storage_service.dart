import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  static Future<String?> uploadImageToFirebase(XFile imageFile) async {
    try {
      // Create a unique file name for the image
      String fileName =
          'ServiceImages/${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';

      // Get a reference to the Firebase Storage
      Reference storageReference =
          FirebaseStorage.instance.ref().child(fileName);

      // Upload the image file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(File(imageFile.path));
      await uploadTask;

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
