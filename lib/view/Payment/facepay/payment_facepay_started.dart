import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:toko_netzme/Models/payment_method.dart';
import 'package:toko_netzme/view/Camera/TakePictureScreen.dart';
import 'package:toko_netzme/view/DemoLiveness.dart';
import 'package:toko_netzme/view/Payment/payment_item.dart';
import 'package:intl/intl.dart' as intl;
import 'package:toko_netzme/view/Payment/payment_method_item.dart';
import 'dart:async';
import 'dart:io';

class PaymentFacePayStartedWidget extends StatelessWidget {
  PaymentFacePayStartedWidget( this.totalPrice);
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetzColor.PrimaryColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: NetzColor.PrimaryColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_facepay.png",
            width: MediaQuery.of(context).size.width * 0.77,
            height: 120,
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Pay using Netzme Pay face recognition. ID card (KTP) required for additional verification.',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                    Text(
                      'Transaction limit: Rp 10.000 - Rp 10.000.000',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(
                    'How to',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              'Take photo of Buyer’s ID Card (KTP) and make sure the photo clear and not blur.',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step 2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              'Scan Buyer’s face using liveness detection feature and follow the instruction.',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: Material(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(26.5) ),
                    color: Color(0xFF801E48),
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.52,
                      height: 53,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/payment.camera',
                          arguments: totalPrice,
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: NetzColor.PrimaryColor),
                      ),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
