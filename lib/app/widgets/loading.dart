import 'package:flutter/material.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  children: const [
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(height: 10),
                    DefaultTextStyle(
                      style: TextStyle(),
                      child: TextCustomized(
                        fontSize: 18,
                        text: "Please wait...",
                        textColor: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}