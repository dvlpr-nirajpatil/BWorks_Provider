import 'package:billionworks/consts/db_collections.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/models/booking_data_model.dart';
import 'package:billionworks/models/service_data_model.dart';
import 'package:billionworks/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController extends ChangeNotifier {
  FirebaseFirestore database = FirebaseFirestore.instance;
  UserDataModel? userData;

  List<ServiceDataModel> services = [];
  List<BookingDataModel> bookings = [];
  List handymans = [];

  get bookingsCount => bookings.length;
  get servicesCount => services.length;
  get handymansCount => handymans.length;

  getUserData(uid) async {
    DocumentSnapshot res =
        await database.collection(DbCollections.provider).doc(uid).get();
    // userData = UserDataModel.fromJson(res.data());
    Map<String, dynamic> data = res.data() as Map<String, dynamic>;
    userData = UserDataModel.fromJson(data);
    notifyListeners();
  }

  fetchAppData() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String currentUserUid = auth.currentUser!.uid;
    getServices(currentUserUid);
    getBookings(currentUserUid);
    getBookings(currentUserUid);
    getUserData(currentUserUid);
    getHandymans(currentUserUid);
  }

  getBookings(String currentUser) async {
    var query = await database
        .collection(DbCollections.bookings)
        .where('provider_id', isEqualTo: currentUser);
    var data = await query.get();
    bookings = data.docs
        .map((e) => BookingDataModel.fromJson(e.data(), e.id))
        .toList();
    notifyListeners();

    query.snapshots().listen((res) {
      bookings.clear();
      bookings.addAll(res.docs
          .map((e) => BookingDataModel.fromJson(e.data(), e.id))
          .toList());
      notifyListeners();
    });

    print(bookings.length);
  }

  getServices(String currentUser) async {
    var query = database
        .collection(DbCollections.services)
        .where('provider_id', isEqualTo: currentUser);

    var data = await query.get();
    services = data.docs
        .map((e) => ServiceDataModel.fromJson(e.data(), e.id))
        .toList();
    notifyListeners();

    query.snapshots().listen((res) {
      services.clear();
      services.addAll(res.docs
          .map(
            (e) => ServiceDataModel.fromJson(e.data(), e.id),
          )
          .toList());
      notifyListeners();
    });
  }

  getHandymans(String currentUser) async {
    var query = database
        .collection(DbCollections.handyman)
        .where('provider_id', isEqualTo: currentUser);

    var data = await query.get();
    handymans = data.docs.map((e) => e.data()).toList();
    notifyListeners();

    query.snapshots().listen((res) {
      handymans.clear();
      handymans.addAll(res.docs.map((e) => e.data()).toList());
      notifyListeners();
    });
  }

  getPayments() {}
  getUserDetails() {}
}
