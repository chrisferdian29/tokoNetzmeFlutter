import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/Models/latest_transaction_item.dart';
import 'package:intl/intl.dart' as intl;

class LatestTransactionView extends StatefulWidget {
  final LatestTransactionItem item;

  LatestTransactionView(
      {Key? key,
        required this.item
      })
      : super(key: key);

  @override
  State<LatestTransactionView> createState() {
    return _LatestTransactionViewState();
  }
}

class _LatestTransactionViewState extends State<LatestTransactionView> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 68.0,
      color: Color(0xFFFFFFFF),
      padding: new EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          left: 16.0, bottom: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_upward,
            color: Colors.green,
            size: 12.0,
          ),
          Padding(padding: EdgeInsets.only(left: 5.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.item.title}', style: TextStyle( fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),),
              Text('${widget.item.description}', style: TextStyle( fontSize: 12, color: Color(0xFF727272)),),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(intl.NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(widget.item.amount), style: TextStyle( fontSize: 16, color: Color(0xFF212121), fontWeight: FontWeight.w600),),
              Text('${widget.item.time}', style: TextStyle( fontSize: 12, color: Color(0xFF727272)),),
            ],
          )
        ],
      ),
    );
  }

}