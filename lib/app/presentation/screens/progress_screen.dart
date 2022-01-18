import 'package:flutter/material.dart';
import 'package:mission_app/app/presentation/widgets/circle_progress_view.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Positioned(
            top: screenHeight*0.2,
            child: CircleProgressView(),
          ),
        ],
      )
    );
  }
}
