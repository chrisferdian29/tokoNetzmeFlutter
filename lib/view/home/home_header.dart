import 'package:flutter/material.dart';

Widget homeHeader (BuildContext context){
  return new Stack(
    children: <Widget>[
      // The containers in the background
      new Column(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .05,
            color: Colors.blue,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .30,
            color: Colors.white,
            padding: new EdgeInsets.only(top: 150, left: 45, right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/ic_pulsa_40px.png',
                      fit: BoxFit.contain,
                      width: 40,
                      height: 40,
                    ),
                    Text('Pulsa', style: TextStyle(fontSize: 12, color: Colors.grey))
                  ]
                ),
                Column(
                    children: [
                      Image.asset('assets/images/ic_data_40px.png',
                        fit: BoxFit.contain,
                        width: 40,
                        height: 40,
                      ),
                      Text('Paket Data', style: TextStyle(fontSize: 12, color: Colors.grey))
                    ]
                ),
                Column(
                    children: [
                      Image.asset('assets/images/ic_menu_invoice_40.png',
                        fit: BoxFit.contain,
                        width: 40,
                        height: 40,
                      ),
                      Text('Invoice', style: TextStyle(fontSize: 12, color: Colors.grey))
                    ]
                ),
              ],
            ),
          )
        ],
      ),
      new Container(
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .01,
            right: 20.0,
            left: 20.0),
        child: new Container(
          height: 156.0,
          width: MediaQuery.of(context).size.width,
          child: new Card(
            color: Colors.white,
            elevation: 4.0,
            child: new Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 73.5,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Toko Balance', style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
                          Text('Rp 650.000', style: TextStyle(fontSize: 18, color: Colors.blueAccent))
                        ],
                      ),
                      MaterialButton(
                        height: 25.0,
                        minWidth: 100.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: new Text(
                          "WITHDRAW",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => {},
                        splashColor: Colors.white,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 73.5,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Agent Balance', style: TextStyle(fontSize: 12, color: Colors.orangeAccent)),
                          Text('Rp 440.000', style: TextStyle(fontSize: 18, color: Colors.orangeAccent))
                        ],
                      ),
                      MaterialButton(
                        height: 25.0,
                        minWidth: 100.0,
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                        child: new Text(
                          "TOP UP",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => {},
                        splashColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}