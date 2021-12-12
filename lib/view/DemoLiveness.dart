import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';

import 'Liveness/LivenessBloc.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}
class _DemoImp extends LivenessDetectionCallback {
  @override
  void onGetDetectionResult(bool isSuccess, Map resultMap) {
    String livenessId = resultMap["livenessId"];
    print(livenessId);
  }
}
class _DemoPageState extends State<DemoPage> {

  late LivenessBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LivenessBloc();
    _bloc.generateAuthLicense();
    LivenessPlugin.initSDK("e66646f9258766b3", "68caf2a2bd2edf91", Market.Indonesia);
    _checkLicense();
  }
  void _checkLicense() async {
    String license = "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";
    String result = await LivenessPlugin.setLicenseAndCheck(license);
    print(result);
    if ("SUCCESS" == result) {
      _canDetectLiveness = true;
      _startLivenessDetection();
      print('startLivenessDetection');
    }else{
      print('license is invalid, expired/format error /appId is invalid');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Sample"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0,),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.loose(
                    Size.square( _bitmap != null ? 300.0 : 0.0, ),
                  ),
                  child: Builder(
                    builder: (_) {
                      if (_bitmap == null) {
                        return Container();
                      }
                      return Image.memory(_bitmap!, fit: BoxFit.cover,);
                    },
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Start Liveness Detection",),
              onPressed: _canDetectLiveness ? _startLivenessDetection : null,
            ),
            _canDetectLiveness ? Container() : Padding(
              padding: const EdgeInsets.all(16.0,),
              child: Text(
                "Your device doesn't support Liveness Detection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0, color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canDetectLiveness = true;
  Uint8List? _bitmap = null;
  final imp = _DemoImp();

  void _startLivenessDetection() {
    LivenessPlugin.startLivenessDetection(imp);
  }
}