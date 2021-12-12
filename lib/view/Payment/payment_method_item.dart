import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toko_netzme/Models/payment_method.dart';
import 'package:toko_netzme/view/DemoLiveness.dart';

class PaymentMethodItemWidget extends StatefulWidget {
  final PaymentMethodType item;

  PaymentMethodItemWidget(
      {Key? key,
        required this.item
      })
      : super(key: key);

  @override
  State<PaymentMethodItemWidget> createState() {
    return _paymentMethodItemState();
  }
}

class _paymentMethodItemState extends State<PaymentMethodItemWidget> {
  Widget _buildItem() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.item.iconPath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: TextStyle(
                    color: Color(0xFF727272),
                    fontSize: 14,
                    fontWeight:
                    FontWeight.w600
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.67,
                child: Text(
                  widget.item.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 12,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return _buildItem();
  }
}