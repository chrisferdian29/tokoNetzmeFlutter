import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:intl/intl.dart' as intl;
import 'package:toko_netzme/Models/latest_transaction_item.dart';
import 'package:toko_netzme/view/home/home_header.dart';
import 'package:toko_netzme/view/home/latest_transaction_view.dart';

class LatestTransactionsWidget extends StatefulWidget {

  var items = [
    LatestTransactionItem(
        title: "Catalog Product Subscription",
        description: "Subscription valid until 4 September 2021",
        amount: 10000,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "Data Plan",
        description: "Telkomsel Data 40MB s/d 110MB",
        amount: 11500,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "PLN Token",
        description: "Token Number 1781-2678-2739...",
        amount: 52500,
        time: "18:20"
    ),
    LatestTransactionItem(
        title: "Catalog Product Subscription",
        description: "Subscription valid until 4 September 2021",
        amount: 10000,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "Data Plan",
        description: "Telkomsel Data 40MB s/d 110MB",
        amount: 11500,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "PLN Token",
        description: "Token Number 1781-2678-2739...",
        amount: 52500,
        time: "18:20"
    ),
    LatestTransactionItem(
        title: "Catalog Product Subscription",
        description: "Subscription valid until 4 September 2021",
        amount: 10000,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "Data Plan",
        description: "Telkomsel Data 40MB s/d 110MB",
        amount: 11500,
        time: "18:00"
    ),
    LatestTransactionItem(
        title: "PLN Token",
        description: "Token Number 1781-2678-2739...",
        amount: 52500,
        time: "18:20"
    )
  ];

  @override
  State<StatefulWidget> createState() {
    return LatestTransactionsState();
  }
}

class LatestTransactionsState extends State<LatestTransactionsWidget> {
  Widget _myListView() {
    return ListView.builder(
      itemCount: widget.items.length + 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if(index == 0) {
          return homeHeader(context);
        } else if (index == 1) {
          return Padding(
            padding: EdgeInsets.all(22),
            child: Text(
              '10 Latest Transcations',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF727272)
              ),
            ),
          );
        } else {
          return LatestTransactionView(item: widget.items[index - 2]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _myListView(),
    );
  }
}