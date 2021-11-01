import 'package:flutter/material.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChanged;

  NumericStepButton(
      {Key? key, this.minValue = 1, this.maxValue = 10, required this.onChanged, required this.initialValue})
      : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {

  int counter= 0;

  @override
  void initState() {
    counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: NetzColor.PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                  size: 8
              ),
              onPressed: () {
                setState(() {
                  if (counter > widget.minValue) {
                    counter--;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
          Container(
            height: 24,
            width: 52,
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color(0xFFe3e3e3), // Set border color
                    width: 1.0),// Set rounded corner radius/ Make rounded corner of border
            ),
            child: Text(
              '$counter',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: NetzColor.PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
              ),
              child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 8,
              ),
              onPressed: () {
                setState(() {
                  if (counter < widget.maxValue) {
                    counter++;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}