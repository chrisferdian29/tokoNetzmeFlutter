import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/Helpers/ReuseWidgets.dart';
import 'package:toko_netzme/repository/model/tokoapi_facepay.response.dart';
import 'package:toko_netzme/repository/retrofit/advance/advance_client.dart';
import 'package:toko_netzme/repository/retrofit/tokoapi/tokoapi_client.dart';
import 'package:toko_netzme/view/Liveness/LivenessBloc.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class PreviewImageScreen extends StatefulWidget {
  String? imagePath;
  Image? image;
  int? price;

  final Map arguments;

  PreviewImageScreen({required this.arguments});

  @override
  _PreviewImageScreenState createState() {
    imagePath = arguments["imagePath"];
    price = arguments["price"];
    return _PreviewImageScreenState();
  }
}

class _PreviewImageScreenState extends State<PreviewImageScreen>
    implements LivenessDetectionCallback {
  late LivenessBloc _bloc;
  String base64ImageIDCard = "";
  String base64ImageLiveness = "";
  String result = "";

  Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://tokoapi-dev.netzme.com/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  var progress;

  @override
  void initState() {
    _bloc = LivenessBloc();
    _bloc.generateAuthLicense();
    LivenessPlugin.initSDK(
        "e66646f9258766b3", "68caf2a2bd2edf91", Market.Indonesia);

    _dio.options.baseUrl = 'https://www.xx.com/api';
    _dio.options.connectTimeout = 60000; //5s
    _dio.options.receiveTimeout = 60000;
    _bloc = LivenessBloc();
    _bloc.generateAuthLicense();
    LivenessPlugin.initSDK(
        "e66646f9258766b3", "68caf2a2bd2edf91", Market.Indonesia);
    _checkLicense();
  }

  void _checkLicense() async {
    final client = AdvanceClient(_dio);
    final queryParameters = <String, dynamic>{
      "licenseEffectiveSeconds": 86400,
      "applicationId": "id.netzme.tokoNetzme"
    };
    client.getLicense(queryParameters).then((value) async => {
          result = await LivenessPlugin.setLicenseAndCheck(value.data!.license)
        });
    getBytesFromFile()
        .then((value) => {base64ImageIDCard = base64Encode(value)});
  }

  void _startLivenessDetection() {
    LivenessPlugin.startLivenessDetection(this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () {
                _startLivenessDetection();
              })
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.file(File(widget.imagePath!), fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Future<List<int>> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath!).readAsBytesSync();

    return bytes;
  }

  void posFacePay() async {
    final tokoAPiClient = TokoapiClient(_dio);

    Future.delayed(const Duration(milliseconds: 100), () {
      final qBody = <String, dynamic>{
        "merchantId": NetzEnvi.username,
        "desc": "payment_face_recognition",
        "buyerImage": base64ImageLiveness,
        "ktpImage": base64ImageIDCard,
        "amount": "IDR ${widget.price}.00"
      };
      final queryParameters = <String, dynamic>{
        "requestId": Uuid().v1(),
        "type": "payment_face_recognition",
        "body": qBody
      };
      print(base64ImageLiveness.isEmpty);
      print(base64ImageIDCard.isEmpty);
      tokoAPiClient
          .postPayFace(queryParameters)
          .then((value) => {
            handleResponseComperation(value)
          })
          .onError((error, stackTrace) => {

        handleResponseComperation(null)
      });
    });
  }
  void handleResponseComperation(TokoapiFacepayResponse? response) {
    Navigator.of(context).pop();
    if(response == null) {
      showAlertDialog(context, null);
      return;
    }
    if(response.status == 100) {
      if (response.body?.paymentStatusCode == "SUCCESS") {
        Navigator.of(context).pushNamed(
          '/payment.success',
          arguments: widget.price,
        );
      }
    } else if(response.body?.paymentStatusCode == "201") {
      showAlertDialog(context, "Saldo netzme anda tidak cukup");
    } else if(response.status == 300) {
      if(response.body?.paymentStatusCode == "404") {
        showAlertDialog(context, "User tidak ditemukan");
      } else if(response.body?.paymentStatusCode == "201") {
        showAlertDialog(context, "Saldo netzme anda tidak cukup");
      } else {
        showAlertDialog(context, 'Kemiripan dibawah batas toleransi');
      }
    } else {
      print('errorhandleResponseComperation');
      print(response.body?.paymentStatusMessage);
      print(response.statusMessage);
      showAlertDialog(context, response.body?.paymentStatusMessage);
    }
  }
  showAlertDialog(BuildContext context, String? message) {
    // set up the buttons
    Widget continueButton = TextButton(
      child: Text("Retry"),
      onPressed:  () {
        Navigator.of(context).pop();
        // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Payment Failed"),
      content: Text(message != null ? message : "Pastikan foto ktp anda jelas, dan jangan menggukan aksesoris saat liveness scan."),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  void onGetDetectionResult(bool isSuccess, Map resultMap) {
    base64ImageLiveness = resultMap["base64Image"];
    ReuseWidgets.showLoaderDialog(context);
    posFacePay();
  }
}
