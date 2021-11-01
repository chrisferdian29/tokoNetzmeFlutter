import 'package:flutter/material.dart';
import 'package:toko_netzme/view/home/latest_transaction.dart';
import 'home/home_header.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        centerTitle: false,
        title: Image.asset('assets/images/netzme_toko_logo.png',fit: BoxFit.contain,
          width: 135),
        elevation: 0,
      ),
      body: LatestTransactionsWidget()
    );
  }
}