
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/reset_through_phone.dart';
import 'constants.dart';

class ResetPhoneGD extends StatelessWidget {
  const ResetPhoneGD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPassPhone(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            const Icon(Icons.phone_android_rounded,
                size: 60.0),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  resetPhone,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Text("Have Password OTP sent via phone"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
