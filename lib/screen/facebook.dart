import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class fb extends StatelessWidget {
  const fb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_swtpoqxk.json'),
      ),
    );
  }
}
