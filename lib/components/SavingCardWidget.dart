import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingCardWidget extends StatelessWidget {
  const SavingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 6.0),
          image: DecorationImage(
              image: AssetImage('lib/images/christmas_sample.jpg'),
              fit: BoxFit.cover
          )
      ),
      child: const Text("Christmas Saving",
          style: TextStyle(fontSize: 40)
      ),
    );
  }
}
