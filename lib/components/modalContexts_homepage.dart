import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:save_app/controllers/savenow_controllers.dart';

class ModalContexts {

  void showSaveMoneyInput(BuildContext context, String goalId){
    final String idgotten= goalId;
    print("The ID we have is $goalId");
    final controller = Get.put(SaveNowController());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(

              children: [
                const SizedBox(height: 20.0),
                Text('Enter Amount You wish to save',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700),),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.amountEntered,
                  keyboardType: TextInputType.number,
                  decoration: amount_saveDecoration(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    SaveNowController.instance.UpdateAmount(controller.amountEntered.text, idgotten);
                    SaveNowController.instance.uploadDepositRecord(controller.amountEntered.text);
                    SaveNowController.instance.initiateMpesa();
                    Navigator.pop(context);
                  },
                  child:Text('Save'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8.0),
                    fixedSize: Size(100, 50),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: Colors.lightGreen,
                    elevation: 20,
                  ),
                )
              ],
            ),
          ),
        );

      },
    );
  }

  void showTransferMoney(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(

              children: [
                const SizedBox(height: 20.0),
                Text('Enter Amount You wish to Transfer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700),),
                const SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: amount_saveDecoration(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){

                  },
                  child:Text('Transfer'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8.0),
                    fixedSize: Size(100, 50),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: Colors.lightGreen,
                    elevation: 20,
                  ),
                )
              ],
            ),
          ),
        );

      },
    );
  }


  void showWidthdrawMoney(BuildContext context, String goalId){
    final controller = Get.put(SaveNowController());
    final String idgotten= goalId;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(

              children: [
                const SizedBox(height: 20.0),
                Text('Enter Amount to Withdraw',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700),),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.amountEntered,
                  keyboardType: TextInputType.number,
                  decoration: amount_saveDecoration(),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: (){
                    SaveNowController.instance.Withdrawal(controller.amountEntered.text, idgotten);
                    SaveNowController.instance.uploadWithdrawRecord(controller.amountEntered.text);

                  },
                  child:Text('Withdraw'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8.0),
                    fixedSize: Size(100, 50),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: Colors.redAccent,
                    elevation: 20,
                  ),
                )
              ],
            ),
          ),
        );

      },
    );
  }
  InputDecoration amount_saveDecoration() {
    return InputDecoration(
      labelText: 'KES:',
      prefixIcon: Icon(Icons.monetization_on),
      labelStyle: TextStyle(color: Colors.blueGrey),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color:  Colors.lightGreen),
          borderRadius: BorderRadius.circular(20.0)
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0,
              color: Colors.lightGreen),
          borderRadius: BorderRadius.circular(50.0)
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.00),

    );
  }


}