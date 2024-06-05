import 'package:billionworks/consts/db_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

String formatDateTimeString(String dateTimeString) {
  // Split the string into date and time parts
  List<String> parts = dateTimeString.split(",");
  if (parts.length != 2) {
    throw Exception("Invalid date time format");
  }

  String datePart = parts[0];
  String timePart = parts[1];

  // Parse date part (assuming format MM/DD/YYYY)
  List<int> dateValues = datePart.split("/").map(int.parse).toList();
  DateTime dateTime = DateTime(dateValues[2], dateValues[0], dateValues[1]);

  // Format date with month name
  String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);

  // Format time with leading zero and AM/PM
  String formattedTime = timePart.padLeft(5, "0").replaceAll(":", ":00") +
      (dateTime.hour < 12 ? "AM" : "PM");

  // Combine formatted date and time
  return "$formattedDate at $formattedTime";
}

acceptBooking(id) {
  print(id);
  var db = FirebaseFirestore.instance;
  var query = db.collection(DbCollections.bookings).doc(id);
  query.update({'status': "accepted"});
}
