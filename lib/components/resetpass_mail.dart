
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/reset_through_mail.dart';
import 'constants.dart';

class loginpg_gestureDetector extends StatelessWidget {
  const loginpg_gestureDetector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPassMail(),
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
            const Icon(Icons.mail_outline_outlined,
                size: 60.0),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  resetEmail,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Text("Have Password OTP sent via E-mail"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
