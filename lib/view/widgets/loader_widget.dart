import 'package:flutter/material.dart';
import 'package:joke_app/utility/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: BrandColors.secondary,),);
  }
}