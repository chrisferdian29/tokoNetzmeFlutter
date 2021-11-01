import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';

Widget posHeader(BuildContext context) {
  return new Stack(
    children: <Widget>[
      // The containers in the background
      new Column(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .05,
            color: Colors.blue,
          )
        ],
      ),
      // The card widget with top padding,
      // incase if you wanted bottom padding to work,
      // set the `alignment` of container to Alignment.bottomCenter
      new Container(
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .01,
            right: 16.0,
            left: 16.0),
        child: new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          child: new Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: new Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 16.0, bottom: 0.0),
                    height: 76.0,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Catalog Content:',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text('5/5 Products',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Subscribtion:',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  MaterialButton(
                                    height: 22.0,
                                    minWidth: 70.0,
                                    color: Colors.orange[300],
                                    textColor: Colors.white30,
                                    child: new Text(
                                      "Subscribe",
                                      style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0x4DFFFFFF),
                                      ),
                                    ),
                                    onPressed: () => null,
                                    splashColor: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                    height: 32.0,
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          NetzColor.cyan),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                              color: NetzColor.cyan)))),
                              onPressed: () => null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text('Share Catalog'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: double.maxFinite,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          NetzColor.cyan),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                              color: NetzColor.cyan)))),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.manage_search),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Manage Catalog'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                //   height: 32.0,
                //   width: MediaQuery.of(context).size.width,
                //   color: NetzColor.cyan,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       Expanded(
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             primary: NetzColor.cyan, elevation: 0,),
                //           onPressed: () {},
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Icon(Icons.share),
                //               SizedBox(
                //                 width: 10.0,
                //               ),
                //               Text('Share Catalog'),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: 1,
                //         height: double.maxFinite,
                //         color: Colors.white,
                //       ),
                //       Expanded(
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             primary: NetzColor.cyan, elevation: 0,),
                //           onPressed: () {},
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Icon(Icons.manage_search),
                //               SizedBox(
                //                 width: 10.0,
                //               ),
                //               Text('Manage Catalog'),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
