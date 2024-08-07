import 'package:billionworks/consts/packages.dart';

void showSnackbar(BuildContext context, text, {color}) {
  final snackBar = SnackBar(
    backgroundColor: color ?? AppColors.primary,
    content: Text(text),
    duration: const Duration(seconds: 3), // You can customize the duration
  );

  // Show the Snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
