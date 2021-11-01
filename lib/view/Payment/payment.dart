import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:toko_netzme/Models/payment_method.dart';
import 'package:toko_netzme/view/DemoLiveness.dart';
import 'package:toko_netzme/view/Payment/facepay/payment_facepay_started.dart';
import 'package:toko_netzme/view/Payment/payment_item.dart';
import 'package:intl/intl.dart' as intl;
import 'package:toko_netzme/view/Payment/payment_method_item.dart';
import 'package:toko_netzme/view/Payment/payment_success_widget.dart';

class PaymentWidget extends StatefulWidget {
  List<PosItemModel>? items;
  int? totalPrice;

  Map arguments;

  var methods = PaymentMethodType.values;
  PaymentWidget({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    items = arguments["items"];
    totalPrice = arguments["totalPrice"];

    return _paymentWidgetState();
  }
}

class _paymentWidgetState extends State<PaymentWidget> {
  Widget _myListView() {
    return ListView.builder(
      itemCount: widget.items?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = widget.items?[index];

        return PaymentItemWidget(item: item!);
      },
    );
  }

  Widget _listViewPaymentMethods() {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: widget.methods.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var method = widget.methods[index];
        return Card(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 8),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                print(method.title);
                if (method == PaymentMethodType.facepay) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => PaymentSuccessWidget(widget.totalPrice ?? 0)),
                  // );
                  Navigator.of(context).pushNamed(
                    '/payment.camera',
                    arguments: widget.totalPrice ?? 0,
                  );
                } else {
                  final snackbar = SnackBar(content: Text('We still on progress for payment using '+method.title));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: PaymentMethodItemWidget(item: method),
            ),
          )
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Payment'),
        backgroundColor: NetzColor.PrimaryColor,
        elevation: 0,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _myListView(),
          Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Divider(),
                  Text(
                    intl.NumberFormat.simpleCurrency(
                            locale: 'id', decimalDigits: 0)
                        .format(widget.totalPrice),
                    style: TextStyle(fontSize: 18.0, color: NetzColor.cyan),
                  ),
                ],
              )),
          Container(
              color: Color(0xFFf9f9f9),
              margin: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method:",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              )),
          _listViewPaymentMethods()
        ],
      ),
    );
  }
}
