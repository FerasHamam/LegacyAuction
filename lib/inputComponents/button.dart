// import 'package:flutter/material.dart';
// //constants
// import '../constants.dart';
// //screens
// import '../screens/StackScreen.dart';

// class RoundedButton extends StatelessWidget {
//   final String text;
//   final bool onSubmit;
//   final Color color, textColor;
//   const RoundedButton({
//     required this.text,
//     required this.onSubmit,
//     this.color = kPrimaryColor,
//     this.textColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//       Container(
//         margin: EdgeInsets.only(top: 40),
//         width: deviceSize.width * 0.8,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(29),
//           child: newElevatedButton(context),
//         ),
//       ),
//     ]);
//   }

//   Widget newElevatedButton(BuildContext context) {
//     return ElevatedButton(
//       child: Text(
//         text,
//         style: TextStyle(color: textColor),
//       ),
//       onPressed: () async {
//         try {
//           bool isValid =  this.onSubmit();
//           print(isValid);
//           if (isValid)
//             Navigator.of(context).pushReplacementNamed(StackScreen.name);
//         } catch (err) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("Something went wrong!"),
//             backgroundColor: Colors.red,
//           ));
//           print(err);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//           primary: color,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//           textStyle: TextStyle(
//               color: textColor, fontSize: 18, fontWeight: FontWeight.w500)),
//     );
//   }
// }
