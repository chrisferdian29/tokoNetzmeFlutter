class TokoapiFacepayResponse {
  TokoapiFacepayResponse({
    this.requestId,
    this.status,
    this.statusMessage,
    this.body,
  });

  String? requestId;
  int? status;
  String? statusMessage;
  TokoapiFacepayResponseBody? body;

  factory TokoapiFacepayResponse.fromJson(Map<String, dynamic> json) => TokoapiFacepayResponse(
    requestId: json["requestId"] == null ? null : json["requestId"],
    status: json["status"] == null ? null : json["status"],
    statusMessage: json["statusMessage"] == null ? null : json["statusMessage"],
    body: json["body"] == null ? null : TokoapiFacepayResponseBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId == null ? null : requestId,
    "status": status == null ? null : status,
    "statusMessage": statusMessage == null ? null : statusMessage,
    "body": body == null ? null : body?.toJson(),
  };
}

class TokoapiFacepayResponseBody {
  TokoapiFacepayResponseBody({
    this.merchantId,
    this.billId,
    this.buyerId,
    this.paymentStatusCode,
    this.paymentStatusMessage,
  });

  String? merchantId;
  String? billId;
  String? buyerId;
  String? paymentStatusCode;
  String? paymentStatusMessage;

  factory TokoapiFacepayResponseBody.fromJson(Map<String, dynamic> json) => TokoapiFacepayResponseBody(
    merchantId: json["merchantId"] == null ? null : json["merchantId"],
    billId: json["billId"] == null ? null : json["billId"],
    buyerId: json["buyerId"] == null ? null : json["buyerId"],
    paymentStatusCode: json["paymentStatusCode"] == null ? null : json["paymentStatusCode"],
    paymentStatusMessage: json["paymentStatusMessage"] == null ? null : json["paymentStatusMessage"],
  );

  Map<String, dynamic> toJson() => {
    "merchantId": merchantId == null ? null : merchantId,
    "billId": billId == null ? null : billId,
    "buyerId": buyerId == null ? null : buyerId,
    "paymentStatusCode": paymentStatusCode == null ? null : paymentStatusCode,
    "paymentStatusMessage": paymentStatusMessage == null ? null : paymentStatusMessage,
  };
}