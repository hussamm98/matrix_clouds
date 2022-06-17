import 'package:flutter/material.dart';

Widget defaultCard({
  double? height,
  double radius = 12.0,
  double elevation = 5.0,
  Widget? child,
}) =>
    Card(
      elevation: elevation,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: child,
    );

Widget buildImage(String urlImage, int index) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.cover)),
    );

Widget defaultButton({
  required VoidCallback? function,
  required IconData? icon,
  required String text,
}) =>
    ElevatedButton.icon(
      onPressed: function,
      icon: Icon(icon),
      label: Text(text),
    );
