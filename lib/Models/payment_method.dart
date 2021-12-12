import 'package:flutter/material.dart';
enum PaymentMethodType {
  facepay, qris, onlinePayment, cash
}

extension PaymentMethodTypeExtension on PaymentMethodType {

  String get title {
    switch (this) {
      case PaymentMethodType.facepay:
        return 'FacePay by Netzme';
      case PaymentMethodType.qris:
        return 'QRIS';
      case PaymentMethodType.onlinePayment:
        return 'Online Payment';
      case PaymentMethodType.cash:
        return 'Cash';
    }
  }

  String get description {
    switch (this) {
      case PaymentMethodType.facepay:
        return 'Pay using Netzme Pay face recognition. ID card (KTP) required for additional verification. Transaction limit: Rp 10.000 - Rp 10.000.000';
      case PaymentMethodType.qris:
        return 'QRIS payment via apps such as Netzme, Gojek, OVO, Dana, etc. Transaction limit: Rp 10.000 - Rp 5.000.000';
      case PaymentMethodType.onlinePayment:
        return 'Buyer can choose preferable online payment method like using credit/debit card, bank transfer or e-money. Transaction limit: Rp 10.000 - Rp 100.000.000';
      case PaymentMethodType.cash:
        return 'Your cash transaction won’t add your Toko Balance and won’t show in your transaction history.';
    }
  }
  String get iconPath {
    switch (this) {
      case PaymentMethodType.facepay:
        return 'assets/images/ic_facepay_40.png';
      case PaymentMethodType.qris:
        return 'assets/images/ic_qr_40.png';
      case PaymentMethodType.onlinePayment:
        return 'assets/images/ic_transferbank_32.png';
      case PaymentMethodType.cash:
        return 'assets/images/ic_transferbank_40.png';
    }
  }
}
