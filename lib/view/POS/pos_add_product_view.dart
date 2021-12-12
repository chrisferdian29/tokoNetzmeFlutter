import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';

Widget posAddProductView (BuildContext context){

  return new DottedBorder(
    padding: new EdgeInsets.only(top: 8.0),
    color: Color(0xFF99cbed),
    strokeWidth: 1,
    child: Container(
      height: 84.0,
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: NetzColor.PrimaryColor,),
            SizedBox(
              width: 10.0,
            ),
            Text('Add Product', style: new TextStyle(color: NetzColor.PrimaryColor),),
          ],
        ),
      ),
    )
  );
}