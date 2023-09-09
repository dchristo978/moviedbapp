import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';

class ListMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BaseText(
          text: 'List of Movies',
        ),
      ),
    );
  }
}
