import 'package:flutter/widgets.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:intl/intl.dart' as intl;

class PaymentItemWidget extends StatefulWidget {
  final PosItemModel item;

  PaymentItemWidget(
      {Key? key,
        required this.item
      })
      : super(key: key);

  @override
  State<PaymentItemWidget> createState() {
    return _paymentItemState();
  }
}

class _paymentItemState extends State<PaymentItemWidget> {

  @override
  Widget build(BuildContext context) {

    int totalPrice = (widget.item.basePrice * widget.item.totalPrice);

    return Container(
        height: 34.0,
        color: Color(0xFFFFFFFF),
    alignment: Alignment.topCenter,
    padding: new EdgeInsets.only(
    top: 16.0,
    right: 16.0,
    left: 16.0, bottom: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${widget.item.totalPrice}x   ', style: TextStyle( fontSize: 14, color: Color(0xFF727272)),),
          Text('${widget.item.title}', style: TextStyle( fontSize: 14, color: Color(0xFF727272)),),
          Spacer(),
          Text(intl.NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(totalPrice), style: TextStyle( fontSize: 14, color: Color(0xFF727272)),),
        ],
      ),
    );
  }

}