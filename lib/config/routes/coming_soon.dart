import 'package:flutter/material.dart';


class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Comming Soon',
          //  style: AppTextStyle.titleSmall18,
          ),
        ),
      ),
    );
  }
}
