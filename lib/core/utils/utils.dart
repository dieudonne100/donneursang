import 'dart:ui';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static void showSnackBar(
      {required BuildContext context,
      required String content,
      bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : kPrimaryColor,
        content: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  content,
                  style: GoogleFonts.roboto(
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.close,
                    color: isError ? Colors.red : kPrimaryColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      ),
    );
  }

  static void showToast(BuildContext context,
      {String content = "Une erreur est survenue", bool isError = true}) {
    var fToast = FToast();
    fToast.init(context);

    fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: isError ? Colors.redAccent : Colors.greenAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            content,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        // gravity: ToastGravity.BOTTOM,
        positionedToastBuilder: (context, child) {
          return Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            child: child,
          );
        },
        toastDuration: const Duration(seconds: 2));
  }

  static Future<T?> showCustomDialog<T>(
      {required BuildContext context,
      bool canPop = true,
      Color? backgroundColor,
      EdgeInsets insetPadding =
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      double blur = 6,
      double? borderRadius,
      required Widget Function(BuildContext ctx) child}) {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: WillPopScope(
                onWillPop: () async {
                  return canPop;
                },
                child: Dialog(
                  backgroundColor: backgroundColor,
                  insetPadding: insetPadding,
                  shape: borderRadius == null
                      ? null
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius)),
                  child: child(ctx),
                ),
              ),
            ),
          );
        });
  }

  static Future<Position> determinePosition() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled return an error message
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator.getCurrentPosition();

    // // If permissions are granted, return the current location
    final preferences = await SharedPreferences.getInstance();

    await preferences.setDouble("latitude", position.latitude);
    await preferences.setDouble("longitude", position.longitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    await preferences.setString("country", placemarks[0].country.toString());
    await preferences.setString(
        "countryCode", placemarks[0].isoCountryCode.toString());
    await preferences.setString("locality", placemarks[0].locality.toString());
    return position;
  }

  static Color adjustColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
}
