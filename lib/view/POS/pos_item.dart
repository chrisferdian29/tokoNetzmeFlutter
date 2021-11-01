import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NumericStepButton.dart';
import 'package:toko_netzme/Models/POSItemModel.dart';
import 'package:intl/intl.dart' as intl;

class PosItemWidget extends StatefulWidget {
  final PosItemModel item;
  final ValueChanged<int> onChanged;

  PosItemWidget({Key? key, required this.item, required this.onChanged})
      : super(key: key);

  @override
  State<PosItemWidget> createState() {
    return _PosItemWidgetState();
  }
}

class _PosItemWidgetState extends State<PosItemWidget> {
  int totalPrice = 0;
  int stock = 0;

  @override
  Widget build(BuildContext context) {
    stock = widget.item.stock;
    return Card(
      elevation: 0.0,
      child: Container(
        height: 84.0,
        color: Color(0xFFFFFFFF),
        alignment: Alignment.topCenter,
        padding:
            new EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0, bottom: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 52.0,
                width: 52.0,
                color: Colors.blue,
                child: Center(
                    child: CachedNetworkImage(
                  height: 52.0,
                  width: 52.0,
                  imageUrl: '${widget.item.imageUrl}',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${widget.item.title}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w600)),
                      Text(
                          intl.NumberFormat.simpleCurrency(
                                  locale: 'id', decimalDigits: 0)
                              .format(widget.item.basePrice),
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF85d62c))),
                      Text("Stock: $stock",
                          style: TextStyle(
                              fontSize: 12, color: Color(0xFF727272))),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Qty:',
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF727272)),
                ),
                NumericStepButton(
                  maxValue: widget.item.stock,
                  minValue: 0,
                  initialValue: widget.item.totalPrice,
                  onChanged: (value) {
                    setState(() {
                      int calculateStock = widget.item.stock - value;
                      if (calculateStock <= widget.item.stock) {
                        stock = calculateStock;
                        widget.item.totalPrice = value;
                        widget.onChanged(value);
                      }
                    });
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
