import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: Color.fromARGB(255, 26, 63, 37),
        rightDotColor: Color.fromARGB(255, 55, 234, 204),
        size: 50,
      ),
    );
  }
}
