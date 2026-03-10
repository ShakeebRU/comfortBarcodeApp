import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../Constants/constants.dart';

class Utils {
  static void showCustomSnackbar({
    required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Adjust for status bar
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 24,
                ), // Optional icon
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // Add the overlay entry
    overlay.insert(overlayEntry);
    // Remove the overlay entry after the duration
    Future.delayed(duration, () => overlayEntry.remove());
  }

  static String getTimeDifferenceString(
    String sessionDate,
    String sessionStartTime,
  ) {
    try {
      // Parse the session start DateTime
      final sessionStartDateTime = DateTime.parse(
        "${sessionDate.split('T')[0]}T${sessionStartTime}Z",
      );

      final now = DateTime.now().toUtc();

      final diff = sessionStartDateTime.difference(now);

      if (diff.isNegative) {
        return "00 : 00 : 00 "; // Session already started
      }

      final days = diff.inDays;
      final hours = diff.inHours % 24;
      final minutes = diff.inMinutes % 60;

      return "$days : $hours : $minutes";
    } catch (e) {
      return "00 : 00 : 00 ";
    }
  }

  static bool isDayAvailable(DateTime date, List<int> dayAvailabilityFlags) {
    // Convert DateTime.weekday (1 = Monday, 7 = Sunday) to 0-based index (0 = Monday, 6 = Sunday)
    int dayIndex = (date.weekday - 1) % 7;

    // Check if the flag at that index is 1 (available)
    return dayAvailabilityFlags[dayIndex] == 1;
  }

  static int getDayNumberFromName(String dayName) {
    switch (dayName.toLowerCase()) {
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      case 'sunday':
        return 7;
      default:
        throw ArgumentError('Invalid day name: $dayName');
    }
  }

  static Future<void> showconnectivityDialog(
    BuildContext context,
    Function func,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Network Error'),
          content: const Text(
            'No Internet Connection. Please check your connection and try again.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => func,
              child: Text(
                'Ok',
                style: TextStyle(color: Constants.textPrimaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      useSafeArea: true,

      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: 60,
            width: 180,
            margin: const EdgeInsets.all(10),
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Loading',
                //   style: TextStyle(
                //       color: Constants.secondaryColor,
                //       fontSize: 16.0,
                //       decoration: TextDecoration.none),
                // ),
                // const SizedBox(width: 16.0),
                CircularProgressIndicator(color: Constants.secondaryColor),
              ],
            ),
          ),
        );
      },
    );
  }

  // static Future<File?> recordVideoFromCamera() async {
  //   final ImagePicker picker = ImagePicker();

  //   try {
  //     final XFile? video = await picker.pickVideo(
  //       source: ImageSource.camera,
  //       maxDuration: const Duration(seconds: 30), // Optional: limit duration
  //       preferredCameraDevice: CameraDevice.rear, // Can be front
  //     );

  //     if (video != null) {
  //       return File(video.path);
  //     } else {
  //       // User cancelled the video capture
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Video recording failed: $e");
  //     return null;
  //   }
  // }

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return null;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      return null;
    }

    // When permissions are granted
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // static Future<String> convertImageToBase64(File imageFile) async {
  //   try {
  //     // Read file bytes
  //     final bytes = await imageFile.readAsBytes();

  //     // Convert to Base64 string
  //     String base64String = base64Encode(bytes);

  //     return base64String;
  //   } catch (e) {
  //     print('Error converting image to base64: $e');
  //     return '';
  //   }
  // }

  // static Future<File?> captureImageFromCamera() async {
  //   final ImagePicker picker = ImagePicker();

  //   try {
  //     final XFile? pickedFile = await picker.pickImage(
  //       source: ImageSource.camera,
  //       preferredCameraDevice: CameraDevice.rear,
  //     );

  //     if (pickedFile != null) {
  //       return File(pickedFile.path);
  //     } else {
  //       print('User cancelled the camera');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error picking image from camera: $e');
  //     return null;
  //   }
  // }

  // static Future<String> audioFileToBase64(String audioPath) async {
  //   try {
  //     File audioFile = File(audioPath);
  //     List<int> audioBytes = await audioFile.readAsBytes();
  //     String base64String = base64Encode(audioBytes);
  //     return base64String;
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // static Future<String> imageFileToBase64(File imageFile) async {
  //   try {
  //     List<int> imageBytes = await imageFile.readAsBytes();
  //     String base64String = base64Encode(imageBytes);
  //     return base64String;
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // static Future<bool> showConfirmDialog(
  //   BuildContext context, {
  //   required String title,
  //   required String content,
  // }) async {
  //   final cont = Provider.of<AuthController>(context, listen: false);
  //   final result = await showGeneralDialog<bool>(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: "Confirm",
  //     barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: const Duration(milliseconds: 300),
  //     pageBuilder: (_, __, ___) {
  //       return const SizedBox.shrink(); // placeholder, actual UI in `transitionBuilder`
  //     },
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       final curved = CurvedAnimation(
  //         parent: animation,
  //         curve: Curves.easeInOut,
  //       );
  //       return ScaleTransition(
  //         scale: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
  //         child: FadeTransition(
  //           opacity: curved,
  //           child: Center(
  //             child: Material(
  //               color: Theme.of(context).dialogBackgroundColor,
  //               elevation: 12,
  //               borderRadius: BorderRadius.circular(20),
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 24,
  //                   vertical: 20,
  //                 ),
  //                 child: IntrinsicWidth(
  //                   stepWidth: 300,
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Text(
  //                         title,
  //                         style: Theme.of(context).textTheme.titleLarge
  //                             ?.copyWith(fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(height: 12),
  //                       Text(
  //                         content,
  //                         style: Theme.of(context).textTheme.bodyMedium,
  //                         textAlign: TextAlign.left,
  //                       ),
  //                       const SizedBox(height: 24),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         children: [
  //                           TextButton(
  //                             onPressed: () => Navigator.of(context).pop(false),
  //                             child: Text(
  //                               "Cancel",
  //                               style: TextStyle(
  //                                 color: cont.isDark
  //                                     ? Colors.white
  //                                     : Colors.black,
  //                               ),
  //                             ),
  //                           ),
  //                           const SizedBox(width: 12),
  //                           ElevatedButton(
  //                             onPressed: () => Navigator.of(context).pop(true),
  //                             style: ElevatedButton.styleFrom(
  //                               backgroundColor: Colors.black,
  //                             ),
  //                             child: const Text(
  //                               "OK",
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   return result ?? false;
  // }

  // static String formatDateString(String dateTimeString) {
  //   try {
  //     DateTime parsedDate = DateTime.parse(dateTimeString);
  //     return DateFormat("dd MMM yyyy").format(parsedDate);
  //   } catch (e) {
  //     return "Invalid Date";
  //   }
  // }

  // static Future<Map<String, String>?> showRemarksAndIssueDialog(
  //   BuildContext context,
  // ) async {
  //   final TextEditingController remarksController = TextEditingController();
  //   final TextEditingController issueController = TextEditingController();

  //   final cont = Provider.of<AuthController>(context, listen: false);
  //   return await showDialog<Map<String, String>?>(
  //     context: context,
  //     barrierDismissible: false, // User must press OK or Cancel
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Enter Details"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: remarksController,
  //               decoration: const InputDecoration(
  //                 labelText: "Remarks(optional)",
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             TextField(
  //               controller: issueController,
  //               decoration: const InputDecoration(
  //                 labelText: "Issue Found (optional)",
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           // TextButton(
  //           //   onPressed: () => Navigator.pop(context, null),
  //           //   child: Text(
  //           //     "Cancel",
  //           //     style: TextStyle(
  //           //       color: cont.isDark ? Colors.white : Color(0xFF002d56),
  //           //     ),
  //           //   ),
  //           // ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pop(context, {
  //                 "remarks": remarksController.text.trim(),
  //                 "issue": issueController.text.trim(),
  //               });
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Color(0xFF002d56),
  //             ),
  //             child: const Text("OK", style: TextStyle(color: Colors.white)),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Future<File?> recordVideo() async {
  //   final ImagePicker picker = ImagePicker();

  //   try {
  //     final XFile? recordedFile = await picker.pickVideo(
  //       source: ImageSource.camera,
  //       maxDuration: const Duration(minutes: 2),
  //     );
  //     if (recordedFile != null) {
  //       return File(recordedFile.path);
  //     }
  //   } catch (e) {
  //     print("Error recording video: $e");
  //   }

  //   return null;
  // }
}
