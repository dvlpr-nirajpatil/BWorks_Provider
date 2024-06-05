import 'package:billionworks/consts/packages.dart';
import 'package:image_picker/image_picker.dart';

class ServiceDetailsModel {
  TextEditingController serviceName = TextEditingController();
  String? selectedCategory;
  String? selectedType;
  String? selectedStatus;
  TextEditingController price = TextEditingController();
  TextEditingController hours = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController desc = TextEditingController();
  XFile? serviceImage;
}

class ServiceDetailsOptions {
  static List<String> serviceTypes = ["Free", "Fixed", "Hourly"];
  static List<String> serviceStatus = ["Active", "Inactive"];
}
