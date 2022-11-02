
import 'dart:convert';

OrderIdModel orderIdModelFromJson(String str) => OrderIdModel.fromJson(json.decode(str));

String orderIdModelToJson(OrderIdModel data) => json.encode(data.toJson());

class OrderIdModel {
  OrderIdModel({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.merchant,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.data,
    this.token,
    this.url,
  });

  int ? id;
  DateTime ? createdAt;
  bool ? deliveryNeeded;
  Merchant  ? merchant;
  dynamic   collector;
  int ? amountCents;
  ShippingData ? shippingData;
  String ? currency;
  bool  ? isPaymentLocked;
  bool ? isReturn;
  bool ? isCancel;
  bool ? isReturned;
  bool ? isCanceled;
  String ? merchantOrderId;
  dynamic walletNotification;
  int ?paidAmountCents;
  bool ? notifyUserWithEmail;
  List<Item> ? items;
  String ? orderUrl;
  int ? commissionFees;
  int ? deliveryFeesCents;
  int ? deliveryVatCents;
  String ? paymentMethod;
  dynamic merchantStaffTag;
  String ? apiSource;
  Data ?data;
  String ? token;
  String ? url;

  factory OrderIdModel.fromJson(Map<String, dynamic> json) => OrderIdModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    deliveryNeeded: json["delivery_needed"],
    merchant: Merchant.fromJson(json["merchant"]),
    collector: json["collector"],
    amountCents: json["amount_cents"],
    shippingData: ShippingData.fromJson(json["shipping_data"]),
    currency: json["currency"],
    isPaymentLocked: json["is_payment_locked"],
    isReturn: json["is_return"],
    isCancel: json["is_cancel"],
    isReturned: json["is_returned"],
    isCanceled: json["is_canceled"],
    merchantOrderId: json["merchant_order_id"],
    walletNotification: json["wallet_notification"],
    paidAmountCents: json["paid_amount_cents"],
    notifyUserWithEmail: json["notify_user_with_email"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    orderUrl: json["order_url"],
    commissionFees: json["commission_fees"],
    deliveryFeesCents: json["delivery_fees_cents"],
    deliveryVatCents: json["delivery_vat_cents"],
    paymentMethod: json["payment_method"],
    merchantStaffTag: json["merchant_staff_tag"],
    apiSource: json["api_source"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "delivery_needed": deliveryNeeded,
    "merchant": merchant!.toJson(),
    "collector": collector,
    "amount_cents": amountCents,
    "shipping_data": shippingData!.toJson(),
    "currency": currency,
    "is_payment_locked": isPaymentLocked,
    "is_return": isReturn,
    "is_cancel": isCancel,
    "is_returned": isReturned,
    "is_canceled": isCanceled,
    "merchant_order_id": merchantOrderId,
    "wallet_notification": walletNotification,
    "paid_amount_cents": paidAmountCents,
    "notify_user_with_email": notifyUserWithEmail,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "order_url": orderUrl,
    "commission_fees": commissionFees,
    "delivery_fees_cents": deliveryFeesCents,
    "delivery_vat_cents": deliveryVatCents,
    "payment_method": paymentMethod,
    "merchant_staff_tag": merchantStaffTag,
    "api_source": apiSource,
    "data": data!.toJson(),
    "token": token,
    "url": url,
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Item {
  Item({
    this.name,
    this.description,
    this.amountCents,
    this.quantity,
  });

  String ? name;
  String ? description;
  int ? amountCents;
  int ? quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    description: json["description"],
    amountCents: json["amount_cents"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "amount_cents": amountCents,
    "quantity": quantity,
  };
}

class Merchant {
  Merchant({
    this.id,
    this.createdAt,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
  });

  int ? id;
  DateTime ? createdAt;
  List<String> ? phones;
  List<String> ? companyEmails;
  String ? companyName;
  String ? state;
  String ? country;
  String ? city;
  String ? postalCode;
  String ? street;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    phones: List<String>.from(json["phones"].map((x) => x)),
    companyEmails: List<String>.from(json["company_emails"].map((x) => x)),
    companyName: json["company_name"],
    state: json["state"],
    country: json["country"],
    city: json["city"],
    postalCode: json["postal_code"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "phones": List<dynamic>.from(phones!.map((x) => x)),
    "company_emails": List<dynamic>.from(companyEmails!.map((x) => x)),
    "company_name": companyName,
    "state": state,
    "country": country,
    "city": city,
    "postal_code": postalCode,
    "street": street,
  };
}

class ShippingData {
  ShippingData({
    this.id,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.shippingMethod,
    this.orderId,
    this.order,
  });

  int ? id;
  String ? firstName;
  String ? lastName;
  String ?street;
  String ?building;
  String ?floor;
  String ?apartment;
  String ?city;
  String ?state;
  String ?country;
  String ?email;
  String ?phoneNumber;
  String ?postalCode;
  String ?extraDescription;
  String ?shippingMethod;
  int ?orderId;
  int ?order;

  factory ShippingData.fromJson(Map<String, dynamic> json) => ShippingData(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    street: json["street"],
    building: json["building"],
    floor: json["floor"],
    apartment: json["apartment"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    postalCode: json["postal_code"],
    extraDescription: json["extra_description"],
    shippingMethod: json["shipping_method"],
    orderId: json["order_id"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "street": street,
    "building": building,
    "floor": floor,
    "apartment": apartment,
    "city": city,
    "state": state,
    "country": country,
    "email": email,
    "phone_number": phoneNumber,
    "postal_code": postalCode,
    "extra_description": extraDescription,
    "shipping_method": shippingMethod,
    "order_id": orderId,
    "order": order,
  };
}
