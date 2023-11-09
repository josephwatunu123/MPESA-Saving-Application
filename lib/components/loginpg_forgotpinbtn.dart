
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_app/components/resetpass_mail.dart';
import 'package:save_app/components/resetpass_phone.dart';

import 'constants.dart';

class Forgotpinbtn extends StatelessWidget {
  const Forgotpinbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                builder: (context) => Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectopText,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30.0),
                      loginpg_gestureDetector(),
                      const SizedBox(height: 20.0),
                      ResetPhoneGD(),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Forgot PIN?',
              style: TextStyle(color: Color.fromARGB(255, 0, 24, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
