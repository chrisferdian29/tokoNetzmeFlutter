import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/Helpers/ReuseWidgets.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:toko_netzme/main_dev.dart';
import 'package:toko_netzme/view/POS/pos_header.dart';
import 'package:toko_netzme/view/POS/pos_item.dart';

import 'POS/pos_add_product_view.dart';
import 'package:intl/intl.dart' as intl;

import 'Payment/payment.dart';

class POSWidget extends StatefulWidget {
  var items = [
    PosItemModel(
        title: 'Beras 5 kg',
        imageUrl:
            'https://static.republika.co.id/uploads/images/inpicture_slide/beras_200607115032-766.jpg',
        basePrice: 51000,
        totalPrice: 0,
        stock: 75),
    PosItemModel(
        title: 'Minyak sayur 1 L',
        imageUrl:
            'https://cdn.hellosehat.com/wp-content/uploads/2017/03/Ternyata-ini-Minyak-Goreng-Sehat-untuk-Menggoreng.jpg',
        basePrice: 18000,
        totalPrice: 0,
        stock: 100),
    PosItemModel(
        title: 'Gula 1 Kg',
        imageUrl:
            'https://storage.aido.id/articles/May2021/cxx584kg68f7hlu8adul.jpg',
        basePrice: 12000,
        totalPrice: 0,
        stock: 33),
    PosItemModel(
        title: 'Telur 1 Kg',
        imageUrl:
            'https://res.cloudinary.com/dk0z4ums3/image/upload/v1592885785/attached_image/inilah-manfaat-telur-dan-cara-menyimpannya-0-alodokter.jpg',
        basePrice: 25000,
        totalPrice: 0,
        stock: 5),
  ];

  int sumTotal = 0;
  int totalItems = 0;

  @override
  State<POSWidget> createState() {
    int total = 0;
    for (var u in items) {
      if (u.totalPrice > 0) {
        print(u.title);
        total += (u.totalPrice * u.basePrice);
        print(total);
      }
    }
    sumTotal = total;
    return _PosWidget();
  }
}

class _PosWidget extends State<POSWidget> {

  Widget _myListView() {
    return ListView.builder(
      itemCount: widget.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          return posAddProductView(context);
        } else {
          final item = widget.items[index];

          return PosItemWidget(
            item: item,
            onChanged: (int value) {
              this.setState(() {
                int total = 0;
                for (var u in widget.items) {
                  if (u.totalPrice > 0) {
                    print(u.title);
                    total += (u.totalPrice * u.basePrice);
                    print(total);
                  }
                }
                print('*********');
                setState(() {
                  widget.sumTotal = total;
                });
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.totalItems = widget.items.where((item) {
      return item.totalPrice > 0;
    }).length;

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Point Of Sale'),
          backgroundColor: NetzColor.PrimaryColor,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.article,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                })
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            posHeader(context),
            Expanded(child: _myListView()),
            Container(
                height: 65.0,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    late List<PosItemModel> itemSelected = widget
                        .items
                        .where((i) => i.totalPrice > 0)
                        .toList();
                    if(itemSelected.isEmpty) {
                      ReuseWidgets.buildErrorSnackBar(context, 'Jumlah Quantity masih 0');
                      return;
                    }
                    Navigator.of(context).pushNamed(
                      '/payment',
                      arguments: {
                        "totalPrice": widget.sumTotal,
                        "items": itemSelected
                      },
                    );
                  },
                  child: Container(
                    margin:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              // add this
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                // give some padding
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min, // set it to min
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Selected Product',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF727272))),
                                        Text("${widget.totalItems} item(s)",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF727272))),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('TOTAL',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: NetzColor.PrimaryColor,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            intl.NumberFormat.simpleCurrency(
                                                locale: 'id',
                                                decimalDigits: 0)
                                                .format(widget.sumTotal),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: NetzColor.PrimaryColor,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: NetzColor.PrimaryColor,
                                ),
                                onPressed: () {

                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ));
  }
}
