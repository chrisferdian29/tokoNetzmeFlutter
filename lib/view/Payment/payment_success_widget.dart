import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:intl/intl.dart' as intl;

class PaymentSuccessWidget extends StatelessWidget {
  int price = 0;

  PaymentSuccessWidget(this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NetzColor.PrimaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.white, // Button color
                      child: SizedBox(
                          width: 120,
                          height: 120,
                          child: Icon(
                            Icons.check,
                            color: NetzColor.PrimaryColor,
                            size: 59,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      'Payment Successful!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Container(
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      'Amount Received',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                        intl.NumberFormat.simpleCurrency(
                            locale: 'id', decimalDigits: 0)
                            .format(price),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Container(
                      width: 156,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () => {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.article,
                              color: Colors.white,
                            ),
                            Text(
                              "See Receipt",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Container(
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  print('close');
                  Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset('assets/images/ic_close_button.png',
                      fit: BoxFit.contain, width: 40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
